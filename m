Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEYVT-0007pU-FH
 for ath10k@lists.infradead.org; Wed, 28 Aug 2013 05:41:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Crash when loading module
References: <CABQkniCRG=UhP2TtKRxC5tquoCoMfuVsuGPPz=zGVKzUcakGxw@mail.gmail.com>
Date: Wed, 28 Aug 2013 08:40:59 +0300
In-Reply-To: <CABQkniCRG=UhP2TtKRxC5tquoCoMfuVsuGPPz=zGVKzUcakGxw@mail.gmail.com>
 (Zaki's message of "Fri, 16 Aug 2013 17:46:31 +0800")
Message-ID: <87fvtujrtg.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Zaki <zaki.bm@gmail.com>
Cc: ath10k@lists.infradead.org

Zaki <zaki.bm@gmail.com> writes:

> Hi,
>
> I am new to ath10k.  Used to have ath9k-based module last time.  I am
> using Freescale MPC8315ERDB board to host the QCA988X_2_0_DEVICE_ID
> device.

Are you sure it's QCA9880 v2? For some reason v1 has same PCI id as v2.

> I am forcing the module to use legacy interrupt handler because my BSP
> doesn't support MSI or MSI-X just yet.

How did you force the legacy interrupt handler?

What version of ath10k are you using? Are you using ath.git master
branch or something else?

> During the module loading, the system crash. Looks like it failed at
> some reset device or reset target function, but i am not too sure
> which one causing it. Below are the logs i collected. I would
> apopreciate any help. Thanks a lot in advance.
>
> # modprobe ath10k_pci.ko
> [   42.465296] cfg80211: Calling CRDA to update world regulatory domain
> [   42.744607] ath10k_pci 0001:02:00.0: BAR 0: assigned [mem 0xa0000000-0xa01ff]
> [   42.752698] ath10k_pci 0001:02:00.0: enabling device (0000 -> 0002)
> [   42.759300] ath10k: MSI-X didn't succeed (1), trying MSI
> [   42.785492] ath10k: legacy interrupt handling
> [   42.850072] Oops: Machine check, sig: 7 [#1]
> [   42.854333] DEBUG_PAGEALLOC MPC831x RDB

According to the link below this error might indicate that the PCI
device is not responding. I wonder if you are using v1 board?

https://lkml.org/lkml/2007/8/23/41

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
