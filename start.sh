#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���festart.sh �X�o�����c�NZS)9��(��K��bò�`�'P�Ę�ax��8��2��[��b��-Y6$CW�^�Vt�V�C߶��9�HIT�f���|绝�w9�9�}/߲�<qz���i��?���ţ?z��w�=�א(Y&�C��p.���]��(�GBȧ���H���D�\�hwwc�6{�>��iT
��y"/͢\�+�rK�*�^.��y}������ޛ[��+������P�����W�V+����]Yonl�*��U����d��{�y�~}8�G`҃�\(�r�n_���	x�������Z���ټ�v��_��P1�����QJeuIm�*�r��3[��Hl���_�h�w�<���?<��o�v��o��O>|��������w��_�|�����}��̏~9�T�~s���y����I���dӒ�q��j������4F��е�f4C�nZ��=��q��� �P1�� ��p��>w��m�Wy��m��85<�&��ͦ`r��3�'}��:������{�=���?ƶ����=�X��%�7H/����2MX�|mm6v�|���	䝾K�Hs]�ҵ��N��O�d���86�6���x6����b�>��6`�a$F�;l�`�9b��ǘ^�"z��g�Jd�nh�O���̎�&÷��վ0N#~"y�R��Qk/Ӡ#�yɵkA����f��ȡ-�h>�)�:Q�y�EE�����1� %��ij^�#W�t����2�l�����*e�sY����	��	�!/
B�! �m"[��#�#- N�Nm�	WE��= �ѥr�9�I��J���`)�ٴ��>��C^ɞ��K_�&���)t!0d�FY��e��nN�I�Z�ɤ��a���Mu�� "�Q��+�nA�
�ljZnm�l�|L��,�)�Y��AY�Xo��/�C���=�����ŋp@�j���i�^���Z�Y�5�Y������A��th�t����,enN�ē�����Ӷ���(4(�� A�{�A�n��, ����e��{�j�]����驋�o���������4�M�	p��B���� _ #y��w��]�TXXDy[���j �
4�!J+C��z�m�lpȲ�%����&A �>7l;Q�fr�+�'�C����	@�'f
�"��F���Ep�([o� (��ڑ�0ؔ��!-R0�X�x��"�Հ��X&H�nsR�C�<���$0�#vlb�#���� ����]HA1BN��>C,�+�6;��RVYx�X�����;���k0�F�At�R�7�	��3��Y#�Y�i�����M�g�kq&�^#u���iC��A�g���a9�[^n3:`�f�W�qkNI{�?���7O~�������?x�R�*&��Ԃ ލ�\�Sj4��M��+�*�	��<~�,6=�E�	�$��	�$p�,(��	��
I<̦Z�#
ڽ%�t��$��
�W,'����(W�s�%-�%]7�s/ͣ��KL��[�Fc �׻�rt�TK����^As�tjg���J78S\'ƙ�Z(U�k��qt��r��9�@[��~-��9߱Ƅ�3���,�=��pT	@=�` �܆8�Y)=�E��Ѭ�݌�ᴢ�)�+[4�nD,/�n�:��α	����.K�0X�6<�¢��7<��[ �G�z<���C�s @X:5�5�(-����+�
�B<�-p"�	q��B��bA��A�ҳ�a��C�E~d5Ptۂi��Po�mX0'��A�Cg<��9Cd�@;�6&�8��w�]�L9O�`8 �+�^�_�����l<^9��[��7�q:�����r���y�!Cސ{�?"�0SƧ�<����ЀZ?d��d�
4@~������;�<�5��I�pTl���%�*���Z�Zwe���ѹ{�~��N�R��۷܊y��կ��n��V�Ճژ.K3�Czob��+e5��Щ���!�3�FA�.�R�Z
�V�"���R�JZ�^5�J���Z+��<!a?�*�d�qv�G��-�Ȋȴ��6W^_W֏֮�/}�ze1�4v�{W
o�7��Q��v�֦8�e�p)�n���`,.唥bN)T�R!��I/��u���<��F<��`#���f���?e0�B���`e���t�a��F���H�U�G��ĳ�Rƈ�K�w��;I�L�W��P�YyN�8$-�N �b��H��
{�}wd�T�x��'���dr�^ZЦ��i���£���5F�i��^�eM��Fn1)f��|�w4�������LJ����	H�g��j�0���E����Q����#�:��	F�z�72)�]�ƯJc�峇/�|�^ؿ8�(|��7\Bڤ�  