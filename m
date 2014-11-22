Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsC4p-0002uN-QA
 for ath10k@lists.infradead.org; Sat, 22 Nov 2014 14:54:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: seeking further info on firmware-3
References: <546F8053.3010003@mindchasers.com>
Date: Sat, 22 Nov 2014 16:53:18 +0200
In-Reply-To: <546F8053.3010003@mindchasers.com> (Robert E. Cochran's message
 of "Fri, 21 Nov 2014 13:11:31 -0500")
Message-ID: <87h9xr8ext.fsf@kamboji.qca.qualcomm.com>
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
To: "Robert E. Cochran" <wifi@mindchasers.com>
Cc: ath10k@lists.infradead.org

"Robert E. Cochran" <wifi@mindchasers.com> writes:

> I'm testing Linux 3.18-rc5 with a QCA9880 / Compex WLE900VX.
>
> During boot, I'm seeing complaints about not finding firmware-3.bin:
>
> ath10k_pci 0001:03:00.0: Direct firmware load for
> ath10k/QCA988X/hw2.0/firmware-3.bin failed with error -2
> ath10k_pci 0001:03:00.0: could not fetch firmware file
> ath10k/QCA988X/hw2.0/firmware-3.bin': -2

You can ignore this warning. ath10k is just telling (in a confusing way)
that it could not find firmware-3.bin and will try firmware-2.bin next.
We should clear up that warning message.

> Can someone please confirm that we should be using
> firmware-3.bin_10.2-00082-4-2 from the 10.2 folder on
> https://github.com/kvalo/ath10k-firmware.git
> ?  When we use this firmware, we see the following during boot:
>
> ath10k_pci 0001:03:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
> 10.2-00082-4-2 api 3 htt 2.1
> ath10k_pci 0001:03:00.0: debug 1 debugfs 1 tracing 0 dfs 0 testmode 1

That's good. Using firmware from 10.2 branch is a good idea. But did you
rename it to firmware-2.bin? It should be called firmware-3.bin.

> If this isn't the latest & greatest firmware, then where do I find
> firmware-3.bin?

ath10k-firmware.git is the correct location to find the firmware.

> And If I should be using firmware-3.bin_10.2-00082-4-2, then are there
> some release notes available for this?

Unfortunately there are no firmware release notes available.

> Finally, please let me know if it's a mistake to be working with
> firmware-3 on the 3.18 kernel.   We're performing some early
> integration testing with this WiFi module, and it's more important to
> get things working as an AP with hostapd than getting the latest
> cutting edge features working.

The number three in "firmware-3.bin" is just an API number, just like
the soname in shared libraries, to make it possible to have backwards
compatibility with the firmware releases. Instead use version string
like "10.2-00082-4-2" to identify between firmware releases.

And yes, using firmware version 10.2-00082-4-2 is the firmware version I
recommend to use at the moment.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
