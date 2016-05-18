Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2wYm-0001Nf-CR
 for ath10k@lists.infradead.org; Wed, 18 May 2016 08:10:29 +0000
Date: Wed, 18 May 2016 13:38:37 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: ath10k temperature issue with late2012 macbook pro
Message-ID: <20160518080837.GA22219@atheros-ThinkPad-T61>
References: <trinity-50a39f6d-5fed-40e5-9232-8426f29b33e3-1463519079223@3capp-gmx-bs70>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-50a39f6d-5fed-40e5-9232-8426f29b33e3-1463519079223@3capp-gmx-bs70>
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
To: Lil Evil <Lil_Evil@gmx.de>
Cc: ath10k@lists.infradead.org

Hi,

On Tue, May 17, 2016 at 11:04:39PM +0200, Lil Evil wrote:
> Hi all,
> =

> I am running an MikroTik R11e-5HacT - High-power triple-chain miniPCI-e C=
ard (routerboard.com/R11e-5HacT) in an apu.2c4 (http://pcengines.ch/apu2c4.=
htm) - so far so good.
> =

> I recently came to realise that the temperature of the AC module goes up =
to 95=B0C reported by sensors during heavy use. Readings seems legitimate v=
erifying by physical touch.
> =

> I played with transmit power and reduced from 30db to 21db with marginal =
difference of 5=B0C.
> =

> The specs give a max temp of 65=B0C, so that doesnt seem very healthy.
> =

> I have tried various firmware and kernel versions without any difference
> =

> The issue seems to be related to my MAC client:
> =

> Windows PC 802.11n transfering at 25MB/sec - WiFi module between 67=B0C -=
 70=B0C
> MAC (next to Windows PC) 802.11n transfering at 15MB/sec - WiFi module re=
aches 85=B0C within 60 sec
> IPAD 802.11ac transfering at 20MB/sec  -  WiFi module between 67=B0C - 70=
=B0C
>  =

> =

> Any pointers welcome?

[shafi] May be you can check this
http://www.spinics.net/lists/linux-wireless/msg130753.html
and get more information

> =

> Cheers
> lIl
> =

> =

> Debug info:
> =

>  =

> root@xenial:~# uname -a
> =

> Linux xenial 4.6.0 #1 SMP Mon May 16 13:53:14 CEST 2016 x86_64 x86_64 x86=
_64 GNU/Linux
> =

>  =

> =

> sensors:
> =

> ath10k_hwmon-pci-0500
> =

> Adapter: PCI adapter
> =

> temp1:        +84.0=B0C
> =

>  =

> =

> lspci -v:
> =

> 05:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wirele=
ss Network Adapter
> =

>     Subsystem: Device 19b6:d03c
> =

>     Flags: bus master, fast devsel, latency 0, IRQ 57
> =

>     Memory at fe200000 (64-bit, non-prefetchable) [size=3D2M]
> =

>     Expansion ROM at fe400000 [disabled] [size=3D64K]
> =

>     Capabilities: [40] Power Management version 2
> =

>     Capabilities: [50] MSI: Enable+ Count=3D1/8 Maskable+ 64bit-
> =

>     Capabilities: [70] Express Endpoint, MSI 00
> =

>     Capabilities: [100] Advanced Error Reporting
> =

>     Capabilities: [140] Virtual Channel
> =

>     Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
> =

>     Kernel driver in use: ath10k_pci
> =

>     Kernel modules: ath10k_pci
> =

>  =

> =

> firmware:
> =

> May 17 11:28:29 xenial kernel: ath10k_pci 0000:05:00.0: Unknown FW IE: 30
> =

> May 17 11:28:29 xenial kernel: ath10k_pci 0000:05:00.0: qca988x hw2.0 tar=
get 0x4100016c chip_id 0x043202ff sub 19b6:d03c
> =

> May 17 11:28:29 xenial kernel: ath10k_pci 0000:05:00.0: kconfig debug 0 d=
ebugfs 1 tracing 0 dfs 1 testmode 0
> =

> May 17 11:28:29 xenial kernel: ath10k_pci 0000:05:00.0: firmware ver 10.2=
.4.97-1-ct-swc-D-002-5558e8 api 5 features wmi-10.x,wmi-10.2,raw-mode,adapt=
ive-cca,mfp crc32 56488b5c
> =

>  =

> =

> Macbook client:
> =

> Interfaces:
> =

> en0:
> =

>   Card Type:    AirPort Extreme  (0x14E4, 0x10F)
> =

>   Firmware Version:    Broadcom BCM43xx 1.0 (7.21.95.175.1a6)
> =

>  =

> =

> =

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
