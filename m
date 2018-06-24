Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fX0vP-0007kh-Ma
 for ath10k@lists.infradead.org; Sun, 24 Jun 2018 09:03:13 +0000
Received: by mail-ed1-x534.google.com with SMTP id b12-v6so3506499edt.8
 for <ath10k@lists.infradead.org>; Sun, 24 Jun 2018 02:03:00 -0700 (PDT)
MIME-Version: 1.0
From: sdnlabs Janakaraj <wsuprabhu@gmail.com>
Date: Sun, 24 Jun 2018 05:02:38 -0400
Message-ID: <CAPWex-CT6dCcBttJguyceR0Xr7iogRc04ga3nvh_pMP9FQKm+A@mail.gmail.com>
Subject: ath10k mesh mode
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi,

I am using Compex WLE900VX RF card on Ubuntu 16.04 single board computer.

I want to create two mesh networks on the same Phy card. I have done
the same on ath9k on a different hardware and have not faced any
issues.

With ath10k, I am not able to fireup my 2nd mesh and syslog reported
stack trace.


Below are the commands that I used:

# 1st Mesh Network

iw dev mesh0 del
iw phy phy0 interface add mesh0 type mp
ifconfig mesh0 hw ether $MAC_ADDRESS
ip link set mesh0 up
iwconfig mesh0 txpower 15
iw dev mesh0 mesh join testmesh

# 2nd Mesh Network

iw dev mesh1 del
iw phy phy0 interface add mesh1 type mp
ifconfig mesh1 hw ether $MAC_ADDRESS1
ip link set mesh1 up
iwconfig mesh1 txpower 15
iw dev mesh0 mesh join testmesh1

Below is the syslog file traces which happens when I enter the last command
iw dev mesh0 mesh join testmesh1


Jun 24 08:35:33 testnode wpa_supplicant[670]: nl80211:
send_and_recv->nl_recvmsgs failed: -33
Jun 24 08:35:33 testnode rsyslogd-2007: action 'action 9' suspended,
next retry is Sun Jun 24 08:36:03 2018 [v8.16.0 try
http://www.rsyslog.com/e/2007 ]
Jun 24 08:35:48 testnode kernel: [  573.186363] device ofmesh entered
promiscuous mode
Jun 24 08:35:48 testnode NetworkManager[416]: <info>
[1529829348.9150] (ofmesh): using nl80211 for WiFi device control
Jun 24 08:35:49 testnode NetworkManager[416]: <info>
[1529829348.9997] devices added (path:
/sys/devices/soc0/soc/1ffc000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:05.0/0000:05:00.0/net/ofmesh,
iface: ofmesh)
Jun 24 08:35:49 testnode NetworkManager[416]: <info>
[1529829348.9999] device added (path:
/sys/devices/soc0/soc/1ffc000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:05.0/0000:05:00.0/net/ofmesh,
iface: ofmesh): no ifupdown configuration found.
Jun 24 08:36:05 testnode kernel: [  589.429219] IPv6:
ADDRCONF(NETDEV_UP): ofmesh: link is not ready
Jun 24 08:36:05 testnode rsyslogd-2007: action 'action 9' suspended,
next retry is Sun Jun 24 08:36:35 2018 [v8.16.0 try
http://www.rsyslog.com/e/2007 ]
Jun 24 08:36:20 testnode systemd[1]: Started Session 4 of user admin.
Jun 24 08:36:36 testnode rsyslogd-2007: action 'action 9' suspended,
next retry is Sun Jun 24 08:37:06 2018 [v8.16.0 try
http://www.rsyslog.com/e/2007 ]
Jun 24 08:36:54 testnode kernel: [  638.381252] ------------[ cut here
]------------
Jun 24 08:36:54 testnode kernel: [  638.381688] WARNING: CPU: 0 PID:
1247 at /build/linux-hwe-edge-AFUOgj/linux-hwe-edge-4.11.0/net/mac80211/ieee80211_i.h:1010
ieee80211_mesh_process_chnswitch+0x1dc/0x258 [mac80211]
Jun 24 08:36:54 testnode kernel: [  638.381694] Modules linked in:
xt_tcpudp iptable_mangle xt_mark ip_tables x_tables dw_hdmi_ahb_audio
imx_ipuv3_crtc caam_jr openvswitch nf_conntrack_ipv6 arc4 nf_nat_ipv6
nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_defrag_ipv6 nf_nat
nf_conntrack libcrc32c snd_soc_fsl_asoc_card snd_ac97_codec
nvmem_imx_ocotp pfuze100_regulator bridge egalax_ts rtc_ds1672 stp llc
ci_hdrc_imx at24 nvmem_core ci_hdrc gpio_pca953x usbmisc_imx caam ulpi
imx_ipu_v3 imx_sdma ath10k_pci ath10k_core ath anatop_regulator
mac80211 snd_soc_fsl_asrc dw_hdmi_imx sky2 etnaviv dw_hdmi imx_ldb
coda imx_vdoa v4l2_mem2mem v4l2_common videobuf2_vmalloc imxdrm
videobuf2_dma_contig drm_kms_helper videobuf2_memops videobuf2_v4l2
spi_imx spi_bitbang videobuf2_core videodev flexcan pwm_imx media
can_dev drm fb_sys_fops imx_thermal syscopyarea
Jun 24 08:36:54 testnode kernel: [  638.381908]  sysfillrect gpmi_nand
sysimgblt pwm_bl pps_gpio uio_pdrv_genirq uio leds_gpio cfg80211
deflate aes_arm_bs crypto_simd cryptd aes_arm twofish_generic
twofish_common camellia_generic serpent_generic blowfish_generic
blowfish_common cast5_generic cast_common des_generic cmac xcbc rmd160
af_key xfrm_algo autofs4
Jun 24 08:36:54 testnode kernel: [  638.382005] CPU: 0 PID: 1247 Comm:
kworker/u8:1 Not tainted 4.11.0-14-generic #20~16.04.1-Ubuntu
Jun 24 08:36:54 testnode kernel: [  638.382010] Hardware name:
Freescale i.MX6 Quad/DualLite (Device Tree)
Jun 24 08:36:54 testnode kernel: [  638.382348] Workqueue: phy0
ieee80211_iface_work [mac80211]
Jun 24 08:36:54 testnode kernel: [  638.382381] [<c0314ae0>]
(unwind_backtrace) from [<c030e774>] (show_stack+0x20/0x24)
Jun 24 08:36:54 testnode kernel: [  638.382400] [<c030e774>]
(show_stack) from [<c0729a80>] (dump_stack+0x90/0xa4)
Jun 24 08:36:54 testnode kernel: [  638.382421] [<c0729a80>]
(dump_stack) from [<c0352990>] (__warn+0xf8/0x110)
Jun 24 08:36:54 testnode kernel: [  638.382437] [<c0352990>] (__warn)
from [<c0352ac0>] (warn_slowpath_null+0x30/0x38)
Jun 24 08:36:54 testnode kernel: [  638.382774] [<c0352ac0>]
(warn_slowpath_null) from [<bf6b0480>]
(ieee80211_mesh_process_chnswitch+0x1dc/0x258 [mac80211])
Jun 24 08:36:54 testnode kernel: [  638.383445] [<bf6b0480>]
(ieee80211_mesh_process_chnswitch [mac80211]) from [<bf6b0c84>]
(ieee80211_mesh_rx_bcn_presp+0x184/0x1b4 [mac80211])
Jun 24 08:36:54 testnode kernel: [  638.384092] [<bf6b0c84>]
(ieee80211_mesh_rx_bcn_presp [mac80211]) from [<bf6b2188>]
(ieee80211_mesh_rx_queued_mgmt+0xd0/0x124 [mac80211])
Jun 24 08:36:54 testnode kernel: [  638.384734] [<bf6b2188>]
(ieee80211_mesh_rx_queued_mgmt [mac80211]) from [<bf660de4>]
(ieee80211_iface_work+0x3e4/0x420 [mac80211])
Jun 24 08:36:54 testnode kernel: [  638.385068] [<bf660de4>]
(ieee80211_iface_work [mac80211]) from [<c036fd6c>]
(process_one_work+0x15c/0x530)
Jun 24 08:36:54 testnode kernel: [  638.385085] [<c036fd6c>]
(process_one_work) from [<c03701a0>] (worker_thread+0x60/0x5bc)
Jun 24 08:36:54 testnode kernel: [  638.385101] [<c03701a0>]
(worker_thread) from [<c0376768>] (kthread+0x144/0x174)Jun 24 08:35:33
testnode wpa_supplicant[670]: nl80211: send_and_recv->nl_recvmsgs
failed: -33
Jun 24 08:35:33 testnode rsyslogd-2007: action 'action 9' suspended,
next retry is Sun Jun 24 08:36:03 2018 [v8.16.0 try
http://www.rsyslog.com/e/2007 ]
Jun 24 08:35:48 testnode kernel: [  573.186363] device ofmesh entered
promiscuous mode
Jun 24 08:35:48 testnode NetworkManager[416]: <info>
[1529829348.9150] (ofmesh): using nl80211 for WiFi device control
Jun 24 08:35:49 testnode NetworkManager[416]: <info>
[1529829348.9997] devices added (path:
/sys/devices/soc0/soc/1ffc000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:05.0/0000:05:00.0/net/ofmesh,
iface: ofmesh)
Jun 24 08:35:49 testnode NetworkManager[416]: <info>
[1529829348.9999] device added (path:
/sys/devices/soc0/soc/1ffc000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:05.0/0000:05:00.0/net/ofmesh,
iface: ofmesh): no ifupdown configuration found.
Jun 24 08:36:05 testnode kernel: [  589.429219] IPv6:
ADDRCONF(NETDEV_UP): ofmesh: link is not ready
Jun 24 08:36:05 testnode rsyslogd-2007: action 'action 9' suspended,
next retry is Sun Jun 24 08:36:35 2018 [v8.16.0 try
http://www.rsyslog.com/e/2007 ]
Jun 24 08:36:20 testnode systemd[1]: Started Session 4 of user admin.
Jun 24 08:36:36 testnode rsyslogd-2007: action 'action 9' suspended,
next retry is Sun Jun 24 08:37:06 2018 [v8.16.0 try
http://www.rsyslog.com/e/2007 ]
Jun 24 08:36:54 testnode kernel: [  638.381252] ------------[ cut here
]------------
Jun 24 08:36:54 testnode kernel: [  638.381688] WARNING: CPU: 0 PID:
1247 at /build/linux-hwe-edge-AFUOgj/linux-hwe-edge-4.11.0/net/mac80211/ieee80211_i.h:1010
ieee80211_mesh_process_chnswitch+0x1dc/0x258 [mac80211]
Jun 24 08:36:54 testnode kernel: [  638.381694] Modules linked in:
xt_tcpudp iptable_mangle xt_mark ip_tables x_tables dw_hdmi_ahb_audio
imx_ipuv3_crtc caam_jr openvswitch nf_conntrack_ipv6 arc4 nf_nat_ipv6
nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_defrag_ipv6 nf_nat
nf_conntrack libcrc32c snd_soc_fsl_asoc_card snd_ac97_codec
nvmem_imx_ocotp pfuze100_regulator bridge egalax_ts rtc_ds1672 stp llc
ci_hdrc_imx at24 nvmem_core ci_hdrc gpio_pca953x usbmisc_imx caam ulpi
imx_ipu_v3 imx_sdma ath10k_pci ath10k_core ath anatop_regulator
mac80211 snd_soc_fsl_asrc dw_hdmi_imx sky2 etnaviv dw_hdmi imx_ldb
coda imx_vdoa v4l2_mem2mem v4l2_common videobuf2_vmalloc imxdrm
videobuf2_dma_contig drm_kms_helper videobuf2_memops videobuf2_v4l2
spi_imx spi_bitbang videobuf2_core videodev flexcan pwm_imx media
can_dev drm fb_sys_fops imx_thermal syscopyarea
Jun 24 08:36:54 testnode kernel: [  638.381908]  sysfillrect gpmi_nand
sysimgblt pwm_bl pps_gpio uio_pdrv_genirq uio leds_gpio cfg80211
deflate aes_arm_bs crypto_simd cryptd aes_arm twofish_generic
twofish_common camellia_generic serpent_generic blowfish_generic
blowfish_common cast5_generic cast_common des_generic cmac xcbc rmd160
af_key xfrm_algo autofs4
Jun 24 08:36:54 testnode kernel: [  638.382005] CPU: 0 PID: 1247 Comm:
kworker/u8:1 Not tainted 4.11.0-14-generic #20~16.04.1-Ubuntu
Jun 24 08:36:54 testnode kernel: [  638.382010] Hardware name:
Freescale i.MX6 Quad/DualLite (Device Tree)
Jun 24 08:36:54 testnode kernel: [  638.382348] Workqueue: phy0
ieee80211_iface_work [mac80211]
Jun 24 08:36:54 testnode kernel: [  638.382381] [<c0314ae0>]
(unwind_backtrace) from [<c030e774>] (show_stack+0x20/0x24)
Jun 24 08:36:54 testnode kernel: [  638.382400] [<c030e774>]
(show_stack) from [<c0729a80>] (dump_stack+0x90/0xa4)
Jun 24 08:36:54 testnode kernel: [  638.382421] [<c0729a80>]
(dump_stack) from [<c0352990>] (__warn+0xf8/0x110)
Jun 24 08:36:54 testnode kernel: [  638.382437] [<c0352990>] (__warn)
from [<c0352ac0>] (warn_slowpath_null+0x30/0x38)
Jun 24 08:36:54 testnode kernel: [  638.382774] [<c0352ac0>]
(warn_slowpath_null) from [<bf6b0480>]
(ieee80211_mesh_process_chnswitch+0x1dc/0x258 [mac80211])
Jun 24 08:36:54 testnode kernel: [  638.383445] [<bf6b0480>]
(ieee80211_mesh_process_chnswitch [mac80211]) from [<bf6b0c84>]
(ieee80211_mesh_rx_bcn_presp+0x184/0x1b4 [mac80211])
Jun 24 08:36:54 testnode kernel: [  638.384092] [<bf6b0c84>]
(ieee80211_mesh_rx_bcn_presp [mac80211]) from [<bf6b2188>]
(ieee80211_mesh_rx_queued_mgmt+0xd0/0x124 [mac80211])
Jun 24 08:36:54 testnode kernel: [  638.384734] [<bf6b2188>]
(ieee80211_mesh_rx_queued_mgmt [mac80211]) from [<bf660de4>]
(ieee80211_iface_work+0x3e4/0x420 [mac80211])
Jun 24 08:36:54 testnode kernel: [  638.385068] [<bf660de4>]
(ieee80211_iface_work [mac80211]) from [<c036fd6c>]
(process_one_work+0x15c/0x530)
Jun 24 08:36:54 testnode kernel: [  638.385085] [<c036fd6c>]
(process_one_work) from [<c03701a0>] (worker_thread+0x60/0x5bc)
Jun 24 08:36:54 testnode kernel: [  638.385101] [<c03701a0>]
(worker_thread) from [<c0376768>] (kthread+0x144/0x174)
Jun 24 08:36:54 testnode kernel: [  638.385117] [<c0376768>] (kthread)
from [<c0309718>] (ret_from_fork+0x14/0x3c)
Jun 24 08:36:54 testnode kernel: [  638.385192] ---[ end trace
8a2584b386693b84 ]---
Jun 24 08:36:57 testnode kernel: [  641.453269] ------------[ cut here
]------------

Jun 24 08:36:54 testnode kernel: [  638.385117] [<c0376768>] (kthread)
from [<c0309718>] (ret_from_fork+0x14/0x3c)
Jun 24 08:36:54 testnode kernel: [  638.385192] ---[ end trace
8a2584b386693b84 ]---
Jun 24 08:36:57 testnode kernel: [  641.453269] ------------[ cut here
]------------

Jun 24 08:37:02 testnode kernel: [  646.573235] ------------[ cut here
]------------
Jun 24 08:37:02 testnode kernel: [  646.573653] WARNING: CPU: 0 PID:
1247 at /build/linux-hwe-edge-AFUOgj/linux-hwe-edge-4.11.0/net/mac80211/ieee80211_i.h:1010
ieee80211_mesh_process_chnswitch+0x1dc/0x258 [mac80211]
Jun 24 08:37:02 testnode kernel: [  646.573658] Modules linked in:
xt_tcpudp iptable_mangle xt_mark ip_tables x_tables dw_hdmi_ahb_audio
imx_ipuv3_crtc caam_jr openvswitch nf_conntrack_ipv6 arc4 nf_nat_ipv6
nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_defrag_ipv6 nf_nat
nf_conntrack libcrc32c snd_soc_fsl_asoc_card snd_ac97_codec
nvmem_imx_ocotp pfuze100_regulator bridge egalax_ts rtc_ds1672 stp llc
ci_hdrc_imx at24 nvmem_core ci_hdrc gpio_pca953x usbmisc_imx caam ulpi
imx_ipu_v3 imx_sdma ath10k_pci ath10k_core ath anatop_regulator
mac80211 snd_soc_fsl_asrc dw_hdmi_imx sky2 etnaviv dw_hdmi imx_ldb
coda imx_vdoa v4l2_mem2mem v4l2_common videobuf2_vmalloc imxdrm
videobuf2_dma_contig drm_kms_helper videobuf2_memops videobuf2_v4l2
spi_imx spi_bitbang videobuf2_core videodev flexcan pwm_imx media
can_dev drm fb_sys_fops imx_thermal syscopyarea
Jun 24 08:37:02 testnode kernel: [  646.573866]  sysfillrect gpmi_nand
sysimgblt pwm_bl pps_gpio uio_pdrv_genirq uio leds_gpio cfg80211
deflate aes_arm_bs crypto_simd cryptd aes_arm twofish_generic
twofish_common camellia_generic serpent_generic blowfish_generic
blowfish_common cast5_generic cast_common des_generic cmac xcbc rmd160
af_key xfrm_algo autofs4
Jun 24 08:37:02 testnode kernel: [  646.573962] CPU: 0 PID: 1247 Comm:
kworker/u8:1 Tainted: G        W       4.11.0-14-generic
#20~16.04.1-Ubuntu
Jun 24 08:37:02 testnode kernel: [  646.573967] Hardware name:
Freescale i.MX6 Quad/DualLite (Device Tree)
Jun 24 08:37:02 testnode kernel: [  646.574307] Workqueue: phy0
ieee80211_iface_work [mac80211]
Jun 24 08:37:02 testnode kernel: [  646.574341] [<c0314ae0>]
(unwind_backtrace) from [<c030e774>] (show_stack+0x20/0x24)
Jun 24 08:37:02 testnode kernel: [  646.574358] [<c030e774>]
(show_stack) from [<c0729a80>] (dump_stack+0x90/0xa4)
Jun 24 08:37:02 testnode kernel: [  646.574380] [<c0729a80>]
(dump_stack) from [<c0352990>] (__warn+0xf8/0x110)
Jun 24 08:37:02 testnode kernel: [  646.574395] [<c0352990>] (__warn)
from [<c0352ac0>] (warn_slowpath_null+0x30/0x38)
Jun 24 08:37:02 testnode kernel: [  646.574730] [<c0352ac0>]
(warn_slowpath_null) from [<bf6b0480>]
(ieee80211_mesh_process_chnswitch+0x1dc/0x258 [mac80211])
Jun 24 08:37:02 testnode kernel: [  646.575375] [<bf6b0480>]
(ieee80211_mesh_process_chnswitch [mac80211]) from [<bf6b0c84>]
(ieee80211_mesh_rx_bcn_presp+0x184/0x1b4 [mac80211])
Jun 24 08:37:02 testnode kernel: [  646.576023] [<bf6b0c84>]
(ieee80211_mesh_rx_bcn_presp [mac80211]) from [<bf6b2188>]
(ieee80211_mesh_rx_queued_mgmt+0xd0/0x124 [mac80211])
Jun 24 08:37:02 testnode kernel: [  646.576664] [<bf6b2188>]
(ieee80211_mesh_rx_queued_mgmt [mac80211]) from [<bf660de4>]
(ieee80211_iface_work+0x3e4/0x420 [mac80211])
Jun 24 08:37:02 testnode kernel: [  646.576996] [<bf660de4>]
(ieee80211_iface_work [mac80211]) from [<c036fd6c>]
(process_one_work+0x15c/0x530)
Jun 24 08:37:02 testnode kernel: [  646.577014] [<c036fd6c>]
(process_one_work) from [<c03701a0>] (worker_thread+0x60/0x5bc)
Jun 24 08:37:02 testnode kernel: [  646.577029] [<c03701a0>]
(worker_thread) from [<c0376768>] (kthread+0x144/0x174)
Jun 24 08:37:02 testnode kernel: [  646.577046] [<c0376768>] (kthread)
from [<c0309718>] (ret_from_fork+0x14/0x3c)
Jun 24 08:37:02 testnode kernel: [  646.577170] ---[ end trace
8a2584b386693b8a ]---

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
