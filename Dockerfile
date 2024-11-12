FROM jupyter/minimal-notebook:latest

USER $NB_UID
WORKDIR $HOME