�:

IDEBDOS V2.2.PRO (c) 2016 Serge.$  ?=HELP  Port: $Out of XTPA memory or allready installed
$
No devices found. Driver not installed
$
Incorrect CP/M version. (NOT CP/M 2.2.)
$CP/M treated upon Orion Advanced CP/M (ACPM 1.x)
$Detected Altair DOS 3.x or higher.
$
No Z80 CPU.
$
SD-card: MSX v1 scheme
$
SD-card: N8VEM scheme
$,  Addr: $
Wrong parameter: $
Wrong parameter: not specified device 0: or 1:$

Begin devices autodetect (less then 20sec per device)... be patient!
$
Model: $
S/N:   $      Rev:   $
Cyls:$,  Heads:$,  Sects:$,  Total:$Mb$
Master (drive  0:) : $

Slave  (drive  1:) : $Drive not ready$NONE$
Status reg = $
Error, code = $
Position:  CHS=$LBA=$,  Access: LBA$,  Access: CHS$, RO$

Usage: IDEBDOS [<drive>:<param_list> [<drive>:<param_list>]]
       [Port:<hex_addr>] [Addr:<hex_bank>,<hex_addr>] [NOINT] [SD] [HELP] [?]

 where  Addr:<bank,addr> - driver resides at <bank,addr>(hex). (ACPM only)
        Port:<addr>    - treat IDE/SD on port <addr>(hex).  Default F600/F762.
        HELP, ? (/?)  - show this help and exit
        NOINT        - pause interrupts during disk I/O
        SD           - access SD-card instead of IDE, so IDE params ignored
        <drive>      - 0=IDE-master, 1=IDE-slave, or 0=SD-card (in SD mode)
        <param_list> - comma separated any list of drive IDE parameters:
                       RO    - use device in read-only mode (both IDE, SD)
                       RW    - use device in read-write mode (default)
                       CHS   - use CHS access mode instead of identified
                       LBA   - use LBA access mode instead of identified
                       RECAL - recalibrate device after reset (very old drives)
                       NONE,SD - no device(skip detection) or SD instead of IDE
                     C=<num> - use <num>(dec) cyllinders instead of identified
                     H=<num> - use <num>(decimal) heads instead of identified
                     S=<num> - use <num>(decimal) sectors instead of identified
Example:
 idebdos 0:ro,chs,c=1800,h=16,s=128,recal 1:rw,lba addr:0,8000 port:F600 noint
$      �  ADDR: PORT: RO RW CHS LBA RECAL NONE C= H= S= 0: 1: ? /? -? HELP SD NOINT x	Y~	w�	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	    nzYes����']  �$� �  >2��2�2=�;� �|��;}�"�;�|����;*  "�###"�"�͞&�;
X :�� :��(b�
*v	|� bk"v	|ͨ}ͨ��R�
o
g�(
~�w#~�w���(V�;:s	ͱ>,ͻ*t	|ͨ}ͨ��;���M��;��L:��2�2�!/"���b�;sj� :�*�2�"�ri� 7<�������	� ��������;* #~#fo"���R7�;��b�;!�"*!�",!�".!�"0:s	O�6>�2�2�>!2��2�2�!"�!!"�*t	��!��� ��!��[t	����!��' ����* #"��s#r * 	��^q#Vp�S���  ~> ��>��#x���y���  �s��> ��1�6>��1  �!��"  �  !*
^#~W#��y�~#� (��f����� �f�#��f�~�:��=��,ȷ��!8� ɿ����D>$`�;��;�~�f(#��!� ~��#�!���	~���f #�
_
W�(����R�� ���
_
W����a��{�� �#~�����08��:8�A8��G0��#~�����08��:0��  ~��#���0��@8
�A��G��7�0��,�_�  ~��#���0��@��0�� �_����{��t��;����
{2s	~���f #��
�St	�����
�Sv	��K��w��K�w��K��w��K>�w��K>�w��K��w=�w ��K����0�s	�r
��K����0�s��K����0�s�r��!�#��!�#���;�  ���{� <2��2=2��>�w ɯ2(�� )�T]))���,))))��\�a�nÅÛßð����>�����N>������2b�GOx� �>2b���G�S͊ü>@����>w�����>i���(��>I��������! �Pw#�>J��������!$ �Pw#�>z����P��P�P�P��@�>�2��l!(=!1G ���l  !I� �����*v	"'"]<!=G �����;�<���;!' ~� Ի#��! �;�~�ͱ>.ͻ�ͱ�n�f�~�))lg#�~
�~	�G�~���  8�(G)����u�t�s�rͽ��;�<�w�.�;�~�F�N��������8�;�#6 T] ����!���!���!"�!"����!�;��Ė�!�S� (͖�!��(�(:���c��;���W�v�:1�*2�2p	"q	:��21�!�"2�!  �:o	# �(��|7?g}o"�:p	*q	21�"2���>2o	��,�#�~ ����^��+>��_�I�+�+�n�f �Xw#�Ww#����&�~ ����^��~ �#���~� <�>�_�,>�_>�V�>�V��;�~ �� }�;���������&͕�~�n�f����~x�w�~y�w�~z�w�~{�w�~c���w�N�q	�F�p
��F�p�^�s�V�r!  ��u�t�������u�t�s�r>���~ ���#��<��;�n�f�6 ͖��;�� 
͖�;�. ͖�;�N	�F
���; �N��$�;�N�F��ͽ�~�� ��;�~����;m�;=����;�ͨ��;�Y�ͨ�~� +��;�]ͨ�\ͨ>:ͻ�^ͨ>:ͻ�[ͨ>,ͻ��;�~ͨ�~ͨ�~ͨ�~ͨ��=�N#~��#ͻy��ͻ���ͱ���0�:8��O����������  �������������O�W_goy�)�O}�'o|�'g{�'_z�'W������N#F����;
���;z�{�|�}��#���0�:8> ûO�G���;���B�`P C�`X D�`` E�`h�� .����x���>�G��>�G�x��IDEBDOS ��>��� ��� "$&(*,�.024��BPX[anx}������������`#(+7�=s��������������#@Z����������[`ehlp������2;B���cmj� �49<FJQhkHKNQT������pv�����(-26:>insw{��������  > � &`o))))���BDM�^#V#{�(�	����!�6:��22�2 2�2�!8"��:�2�*�"��Ol���_��S�B��yְ8s�0o!�o0$~#fo�:�< Y:!�<(!�w#w#w#w�{2�< ;{<!�(!~#�~!  �+� +��:�< :!�<(!s#r��:o�<��> !  ��ͧ,!�(!s###r��ͧ,!�(! r+s+x�w��!��  ������Xw#�Ww#�> ���:�!�<(�!��~�(D�~ ��(=�®�,(3�c�,(&8#> �_�I8!�� ���~�n�f����Y�  >��ͧ�&��������!�  ������ �ͧ�&������͒�:�!�<(�!��~�(��~� ��~ ��(���,(��c�,(�8�>0�_�I8�!�� ���n�f�~���,o>���د���N#~�Wy#�X�> ���*�:  +|� �ɯ�w �_o�@ ��x�{���w �_o/��w}���x�{�� �_o� }�}���x�{���~�(�~ �ݶ���^�~�]�~�\�~�[A�~�W�^�f�n�N�F���i`�N�F������~ ������^��|�]�}�\�}�[>�Z��ͧ����,�!�(�!�{!��o0$~#fo ���!�������^�V�~�����o������~��> ��#x������:������n�f�~������ٯ������������Z�������������P0�d������gx��G���8�������Z�� ������������������o�����o��������> !  �����> !  ���ɯgo�>!  )��j�0	0= ���T}!   ����j��j8�B0	=< �_MD�����B��>� ��W��6��W>��?>��2~���Ûßð���J�2b���b�>	����O!b�>�w�w��w���!b�~�>w��w �{��p>b�>����c��c�z�!    ��Mz�M{�M|�M}�M>��M! N��P��+�|(��! N�P���+�|(��>X����>��M!��  ���c��~��>��M>��M�����>Q���������!�� ���c��~���P�P���S N�P<(�x(����	N#F#^#V#~#fo�)��j�S\e. ����� W�o���� W�o�C��J>������zw   #� �> �����~  #� �> ��������zK�?��0�do��9�9�9�9�>�O���Z�������������?�����>��o�j�
��
��
��;�;��=�=�=���Z��������������g���&,!�(!�s�����ͧ����͆���� ����oͧ����͆�͒�� ������4�4�4��4��4��4�                                            ����ͧ����͆���� ����oͧ����͆�͒�� ������4�4�4��4��4��4�                         