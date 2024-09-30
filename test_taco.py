from taco import TACOAgent
from types import SimpleNamespace
import torch

obs = torch.randn(1024, 9, 84, 84)
obs_shape = torch.randn(9, 84, 84).shape
action_shape = torch.randn(2).shape
action = torch.randn(1024, 2)
action_seq = torch.randn(1024, 3, 1)
next_obs = torch.randn(1024, 9, 84, 84)
reward = torch.randn(1024, 1)




taco = TACOAgent(
    obs_shape,
    action_shape,
    device='cpu',
    lr=1e-4,
    encoder_lr=1e-4, 
    feature_dim=50,
    hidden_dim=1024,
    critic_target_tau=0.01,
    num_expl_steps=2000,
    update_every_steps=20, 
    stddev_schedule='linear(1.0,0.1,100000)',
    stddev_clip=0.3,
    use_tb=False,
    reward=False,
    multistep=3,
    latent_a_dim='none',
    curl=False
)

taco.update_taco(obs,action, action_seq, next_obs, reward)
