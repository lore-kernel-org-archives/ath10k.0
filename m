Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bT3mP-0002Oq-Ai
 for ath10k@lists.infradead.org; Fri, 29 Jul 2016 09:08:49 +0000
From: <Perry_Yuan@Dell.com>
Date: Fri, 29 Jul 2016 17:07:46 +0800
Subject: RE: ath10k fail to load firmware
Message-ID: <A3D794F1192BBF449DF2EC3D7EE263F44A544E3AB0@SHAX7MCDC101.APAC.DELL.COM>
References: <20160719070932.GA2751@redhat.com>
 <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
 <20160719072754.GB2751@redhat.com> 
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: sgruszka@redhat.com, michal.kazior@tieto.com
Cc: David_D_Wang@dell.com, karl@redhat.com, kvalo@qca.qualcomm.com, Yijun_Shen@Dell.com, ath10k@lists.infradead.org

Hi Stanislaw:

We got the right firmware but the kernel kernel-3.10.0-473.el7.x86_64.rpm i=
s still not working at all .
In order to fix the issue for DW1820 .  I am afraid  that you have to merge=
 the below patches for RHEL7.3 kernel. I have verified those patches . DW18=
20 card driver is working well  on  -473  kernel  now .

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3De50525bef593c3dd0564df676c567d77f7c20322

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3D8d0a0710ea0d22881fdb40eb79d346a98cc64ae6

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3Dfee48cf8374569a3888fd8c8536283e6067f0cfb

Thanks .

keep up the good work
Perry=A0 Yuan
Dell | Client Software Group | Platform Sftwr Senior Engineer
office +86 21 22030689, mobile +86 18521512823
perry_yuan@dell.com
Please consider the environment before printing this email.


-----Original Message-----
From: Yuan, Perry =

Sent: Friday, July 29, 2016 3:45 PM
To: 'Stanislaw Gruszka' <sgruszka@redhat.com>; Michal Kazior <michal.kazior=
@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>; ath10k@lists.infradead.org; Shen, =
Yijun <Yijun_Shen@Dell.com>; David D Wang (David_D_Wang@dell.com) <David_D_=
Wang@dell.com>; Karl Hastings <karl@redhat.com>
Subject: RE: ath10k fail to load firmware

Dell - No Restrictions - Confidential =


HI Stanislaw:
Now we have got the available firmware for DW1820 wireless card ,but we  fo=
und  one new problem .
I built   upstream  4.6.4  and 4.7  kernel  code  and install the kernel im=
ages , the wireless driver can work , which means I  can get  IP address an=
d  ping  external network successfully .

But it cannot  work with  RHEL 7.3 test kernel   kernel-3.10.0-473.el7.x86_=
64.rpm . This kernel will  occur panic  frequently .
Even  system can get IP address from AP . but it cannot ping external  netw=
ork . =

So I would think the backport driver have some issue . =

I have found some differences  with upstream 4.7 kernel code  where you  do=
 backport   . I will  provide the kernel panic log later .



keep up the good work
Perry=A0 Yuan
Dell | Client Software Group | Platform Sftwr Senior Engineer office +86 21=
 22030689, mobile +86 18521512823 perry_yuan@dell.com Please consider the e=
nvironment before printing this email.

-----Original Message-----
From: Stanislaw Gruszka [mailto:sgruszka@redhat.com]
Sent: Tuesday, July 19, 2016 3:28 PM
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>; ath10k@lists.infradead.org; Yuan, =
Perry <Perry_Yuan@Dell.com>
Subject: Re: ath10k fail to load firmware

On Tue, Jul 19, 2016 at 09:18:01AM +0200, Michal Kazior wrote:
> On 19 July 2016 at 09:09, Stanislaw Gruszka <sgruszka@redhat.com> wrote:
> > Perry from Dell has ath10k device, which do not work with current =

> > linux-firmware. It's on RHEL kernel, however wirelss stack and =

> > drivers are from 4.7-rc1 (I did not update to 4.7 final yet, since I =

> > do not see ath10k fix, which could possibly help here). Partial =

> > dmesg is in the attachment.
> =

> hw.3 qca6174 chips tend to require very specific board data for proper =

> calibration.
> =

>   [ 3838.601884] ath10k_pci 0000:01:00.0: failed to fetch board data =

> for =

> bus=3Dpci,vendor=3D168c,device=3D003e,subsystem-vendor=3D1028,subsystem-d=
evice
> =3D0310
> from ath10k/QCA6174/hw3.0/board-2.bin
>   [ 3838.601920] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A
> crc32 ed5f849a
> =

> Your board-2.bin doesn't contain the matching board data and the =

> driver then falls back to the older board API1 which is pretty much =

> doomed to fail on qca6174 hw.3.
> =

> @Kalle: Perhaps ath10k needs to fail early with an adequate message =

> for qca6174 hw.3 if board API2 lookup fails (e.g. hw_params flag =

> because this seems to be quite closely coupled with hardware itself).
> =

> @Stanislaw: You either need to grab a more recent board-2.bin =

> (https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0),

@Perry, could you replace board-2.bin from above link on /lib/firmware/ath1=
0k/QCA6174/hw3.0/ and check if that work ?

> ask Kalle & wait, or cook up your own (if you really need it working
> *now*) by getting Windows driver and dissecting it (the .inf file =

> contains enough information for you to map board data also referred to =

> as eeprom-something in the Windows blob).

I think we can wait till firmware will be updated upstream, however Dell wo=
uld like to know if what we provide in new RHEL7 release will work on their=
 hardware.

Thanks
Stanislaw

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
