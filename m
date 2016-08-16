Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from champagne.comp.nus.edu.sg ([137.132.80.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZWDq-0006C1-7i
 for ath10k@lists.infradead.org; Tue, 16 Aug 2016 04:43:32 +0000
Received: from mail-io0-f198.google.com ([209.85.223.198])
 by champagne.comp.nus.edu.sg (Exim) with esmtps (TLSv1:DES-CBC3-SHA:168)
 id 1bZWDP-00036S-Un
 for ath10k@lists.infradead.org; Tue, 16 Aug 2016 12:43:04 +0800
Received: by mail-io0-f198.google.com with SMTP id f14so203528315ioj.2
 for <ath10k@lists.infradead.org>; Mon, 15 Aug 2016 21:43:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160816035841.M15556@universe.cdotb.ernet.in>
References: <20160816035841.M15556@universe.cdotb.ernet.in>
From: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Date: Tue, 16 Aug 2016 12:42:21 +0800
Message-ID: <CA+uUJGuJ6jn22NRakSk1jsDv8wHkT7rG-cQmZ7ASTcscgNrsgQ@mail.gmail.com>
Subject: Re: Issue with ATH10K driver while bringing up mesh interface
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
To: Sridhar Kondabathini <sridhark@cdot.in>
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

Hi Sridhar,

Looking at only the error, I can say that you need to load the ath10k
driver with rawmode=1 parameter. Try the following commands in
sequence:
(text following # are comments)

sudo modprobe -r ath10k_pci   # unloads ath10k_pci
sudo modprobe -r ath10k_core # unloads ath10k_core
sudo modprobe ath10k_core rawmode=1 # loads back ath10k_core with rawmode=1
sudo modprobe ath10k_pci # loads back ath10k_pci

I am writing sudo assuming you are a sudoer and not root. You could
also do it in an auto manner following [1]

Cheers,
Raj Joshi

[1] https://wiki.archlinux.org/index.php/kernel_modules#Using_files_in_.2Fetc.2Fmodprobe.d.2F

On Tue, Aug 16, 2016 at 12:06 PM, Sridhar Kondabathini <sridhark@cdot.in> wrote:
>
> Hi,
>    When we are trying to bring up AP to add mesh interfaces on T1024 board with
> kernel-3.12; ath10k drivers backported from 4.4;hostapd 2.5 for 11AC support is
> used, then we are getting below error -
>
> ----------------------------------------------------------------------------------
>
> T1024# ifconfig mesh0
>
> mesh0     Link encap:Ethernet  HWaddr 04:f0:21:1b:7d:b6
>           BROADCAST MULTICAST  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
> T1024# ifconfig mesh0 0.0.0.0 up
>
> [ 8694.385554] ath10k_pci 0001:03:00.0: must load driver with rawmode=1 to add mesh
> interfaces
>
>
> ----------------------------------------------------------------------------------
>
> How to resolve this issue, can you please help on this.
>
>
> Regards,
>
> Sridhar Kondabathini,
> Research engineer,
> PSG lab,
> Center for Development Of Telematics
> 9480484821.
>
>
>
>
> Disclaimer:
> ----------
> This email and any files transmitted with it are confidential and intended solely
> for
> the use of the individual or entity to whom they are addressed.  If you are not the
> intended recipient you are notified that disclosing, copying, distributing or taking
> any
> action in reliance on the contents of this information is strictly prohibited. The
> sender does not a
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
