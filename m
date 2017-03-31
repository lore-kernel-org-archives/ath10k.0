Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cu2Q6-0008La-20
 for ath10k@lists.infradead.org; Fri, 31 Mar 2017 19:41:15 +0000
Received: by mail-qk0-x231.google.com with SMTP id p22so75515197qka.3
 for <ath10k@lists.infradead.org>; Fri, 31 Mar 2017 12:40:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87y3vlr9r6.fsf@kamboji.qca.qualcomm.com>
References: <CAEi_5N3aP1F5ChkZ64jxpKmAAAEVwq0Ep_LGRnhFDfC6=N5v1w@mail.gmail.com>
 <87y3vlr9r6.fsf@kamboji.qca.qualcomm.com>
From: Chirag Shahani <chirag.shahani@gmail.com>
Date: Fri, 31 Mar 2017 12:40:52 -0700
Message-ID: <CAEi_5N2V+HMPSQOMFYHVfpCP2xo0TzQ3PeCaDNEM-egJEu_OYQ@mail.gmail.com>
Subject: Re: firmware version 10.2.4.70.54 crash when running on
 centos-7.3(kernel version -> 3.10.0-514.el7.x86_64)
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

Thank you for the reply..

The ath10k driver came with with the distro. when I installed
centos7.3. I did not have to install the driver manually. The firmware
version is 10.2.3.70.54. Isn't that one of the latest releases?

Originally, I had firmware-version: 999.999.0.636 runnning on NSG with
centos 7.1 kernel 3.10.0-229.48.1.el7.x86_64 for which I had to
compile the driver. However, with this even doing ifconfig wlan0
promisc resulted in a following crash of the firmware.

Mar 31 00:37:55 localhost kernel: device wlan1 entered promiscuous mode
Mar 31 00:37:57 localhost kernel: ath10k: firmware crashed!
Mar 31 00:37:57 localhost kernel: ath10k: hardware name qca988x hw2.0
version 0x4100016c
Mar 31 00:37:57 localhost kernel: ath10k: firmware version: 999.999.0.636
Mar 31 00:37:57 localhost kernel: ath10k: target register Dump
Location: 0x0040AC14
Mar 31 00:37:57 localhost kernel: ath10k: target Register Dump
Mar 31 00:37:57 localhost kernel: ath10k: [00]: 0x4100016C 0x00000000
0x009C4521 0x00000000
Mar 31 00:37:57 localhost kernel: ath10k: [04]: 0x009C4521 0x00060530
0x00000019 0x00955A00
Mar 31 00:37:57 localhost kernel: ath10k: [08]: 0x000808B5 0x00000000
0x0040CC94 0x00000020
Mar 31 00:37:57 localhost kernel: ath10k: [12]: 0x00000000 0x00000000
0x00958360 0x0095836B
Mar 31 00:37:57 localhost kernel: ath10k: [16]: 0x0042556C 0x0040AD94
0x0043114C 0x00000000
Mar 31 00:37:57 localhost kernel: ath10k: [20]: 0x00000000 0x0040AD64
0x00000000 0x00000000
Mar 31 00:37:57 localhost kernel: ath10k: [24]: 0x809A0978 0x0040AD94
0x0043949C 0x2022D7B8
Mar 31 00:37:57 localhost kernel: ath10k: [28]: 0x809AD1A2 0x0040ADE4
0x0043949C 0x0043FD1C
Mar 31 00:37:57 localhost kernel: ath10k: [32]: 0x00000000 0x0000000F
0x00000000 0x00425468
Mar 31 00:37:57 localhost kernel: ath10k: [36]: 0x00000000 0x00000000
0x00000000 0x00000000
Mar 31 00:37:57 localhost kernel: ath10k: [40]: 0x00000000 0x00000000
0x00000006 0x00000003
Mar 31 00:37:57 localhost kernel: ath10k: [44]: 0x00439C90 0x00000000
0x00000000 0x00400000
Mar 31 00:37:57 localhost kernel: ath10k: [48]: 0x809AE0B4 0x0040AE04
0x00400000 0x0043FD1C
Mar 31 00:37:57 localhost kernel: ath10k: [52]: 0x00000001 0x00000000
0x00423330 0x00400000
Mar 31 00:37:57 localhost kernel: ath10k: [56]: 0x809AE17E 0x0040AE44
0x0040FE6C 0x0040D310
Mar 31 00:37:57 localhost kernel: ieee80211 phy0: Hardware restart was requested
Mar 31 00:38:00 localhost kernel: ath10k: failed to to request monitor
vdev 3 stop: -11
Mar 31 00:38:05 localhost kernel: ath10k: failed to synchronise
monitor vdev 3: -110
Mar 31 00:38:05 localhost kernel: ath10k: failed to stop monitor vdev: -110
Mar 31 00:38:08 localhost kernel: ath10k: failed to request wmi
monitor vdev 3 removal: -11
Mar 31 00:38:08 localhost kernel: ath10k: failed to delete monitor vdev: -11
Mar 31 00:38:10 localhost kernel: ath10k: firmware crashed!
Mar 31 00:38:10 localhost kernel: ath10k: hardware name qca988x hw2.0
version 0x4100016c
Mar 31 00:38:11 localhost kernel: ath10k: firmware version: 999.999.0.636
Mar 31 00:38:11 localhost kernel: ath10k: target register Dump
Location: 0x0040AC14
Mar 31 00:38:11 localhost kernel: ath10k: target Register Dump
Mar 31 00:38:11 localhost kernel: ath10k: [00]: 0x4100016C 0x00000000
0x009C4521 0x00000000
Mar 31 00:38:11 localhost kernel: ath10k: [04]: 0x009C4521 0x00060330
0x00000019 0x00955A00
Mar 31 00:38:11 localhost kernel: ath10k: [08]: 0x00083E82 0x00000000
0x0040CC94 0x00000020
Mar 31 00:38:11 localhost kernel: ath10k: [12]: 0x00000000 0x00000000
0x00958360 0x0095836B
Mar 31 00:38:11 localhost kernel: ath10k: [16]: 0x809A0978 0x0040AD94
0x0043949C 0x0040D074
Mar 31 00:38:11 localhost kernel: ath10k: [20]: 0x0000FFFF 0x00000000
0x0042F664 0x00000000
Mar 31 00:38:11 localhost kernel: ath10k: [24]: 0x809A0978 0x0040AD94
0x0043949C 0x20FA0BCA
Mar 31 00:38:11 localhost kernel: ath10k: [28]: 0x809AD1A2 0x0040ADE4
0x0043949C 0x0043F68C
Mar 31 00:38:11 localhost kernel: ath10k: [32]: 0x809B01DA 0x00000000
0x00410110 0x0041937C
Mar 31 00:38:11 localhost kernel: ath10k: [36]: 0x00000000 0x00000000
0x00000000 0x00000000
Mar 31 00:38:11 localhost kernel: ath10k: [40]: 0x00000000 0x00000000
0x00000000 0x00412700
Mar 31 00:38:11 localhost kernel: ath10k: [44]: 0x00439BB8 0x00000000
0x00000000 0x00400000
Mar 31 00:38:11 localhost kernel: ath10k: [48]: 0x809AE0B4 0x0040AE04
0x00400000 0x0043F68C
Mar 31 00:38:11 localhost kernel: ath10k: [52]: 0x00000001 0x00000000
0x00423330 0x00400000
Mar 31 00:38:11 localhost kernel: ath10k: [56]: 0x809AE17E 0x0040AE44
0x0040FE6C 0x0040D310
Mar 31 00:38:14 localhost kernel: ath10k: failed to synchronise setup
for vdev 0: -110
Mar 31 00:38:17 localhost kernel: ath10k: failed to set preamble for vdev 0: -11
Mar 31 00:38:20 localhost kernel: ath10k: failed to set beacon
interval for vdev 1: -11
Mar 31 00:38:23 localhost kernel: ath10k: failed to set beacon mode
for vdev 1: -11

My aim to use this kernel centos 7.1 kernel
3.10.0-229.48.1.el7.x86_64. Could you please let me know which
backport relase I should try to have the latest firmware for centos
7.1 kernel 3.10.0-229.48.1.el7.x86_64

Thank you,
--
Chirag

On Fri, Mar 31, 2017 at 4:00 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Chirag Shahani <chirag.shahani@gmail.com> writes:
>
> > I am using the ath10_pci driver with firmware version 10.2.4.70.54
> > running on centos-7.3(kernel version -> 3.10.0-514.el7.x86_64). The
> > driver came with centos 7.3 install. Could you please confirm this
> > firmware is supported for this kernel version.
>
> 3.10 is ancient. I guess in theory it should work but nobody tests so
> old version of ath10k. I recommend using backports package to upgrade
> ath10k for your kernel.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
