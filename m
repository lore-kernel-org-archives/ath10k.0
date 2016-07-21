Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x22d.google.com ([2607:f8b0:4002:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQEz5-0005vb-5o
 for ath10k@lists.infradead.org; Thu, 21 Jul 2016 14:29:59 +0000
Received: by mail-yw0-x22d.google.com with SMTP id z8so54128320ywa.1
 for <ath10k@lists.infradead.org>; Thu, 21 Jul 2016 07:29:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+uUJGu6qSmxupEkaqPmLBQf53wQtjyXidFCf+4X9vMxL4WmoA@mail.gmail.com>
References: <CA+uUJGu6qSmxupEkaqPmLBQf53wQtjyXidFCf+4X9vMxL4WmoA@mail.gmail.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Thu, 21 Jul 2016 19:59:14 +0530
Message-ID: <CABPxzY+KHVGAUKjU2kWdKiEPZFV3=sOnWe-qBMDOPffw_vJ0+g@mail.gmail.com>
Subject: Re: Completely disabling RTS/CTS
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
To: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Cc: ath10k <ath10k@lists.infradead.org>

On Thu, Jul 21, 2016 at 7:45 PM, Raj Joshi <rajjoshi@comp.nus.edu.sg> wrote:
> Hi all,
>
> I am trying to "completely" disable RTS/CTS.
>
> * Case 1: Using iw/iwconfig when I set the sender's RTS threshold to a
> very high value (RTS thr=10000 B), I expect that no RTS should be
> sent. However, it seems that this threshold is not being honored and I
> can sniff large number of RTS/CTS frames. I verified that no A-MSDU is
> exceeding 10000 B.
> * Case 2: Interestingly, when I set the sender's RTS threshold to off
> (RTS thr:off), compared to case #1 much less number of RTS/CTS frames
> are seen and throughput is seen to improve. But I can still see
> RTS/CTS frames being sent.
> * Since the channel is clear and much isolated, and there is just one
> AP and one STA, there is negligible chance of other factors playing
> any role.
> * There is one change though that I have disabled dynamic bandwidth
> i.e. ar->wmi.pdev_param->dynamic_bw set zero in mac.c. I believe this
> is likely not an issue as similar RTS/CTS behavior is seen even with
> dynamic_bw set to 1 (there are no heterogeneous channel widths in the
> network in any case).
> * Another thing I noticed is that the RTS/CTS protection mode if set,
> it is set to CTS-to-self, rather than "RTS/CTS" i.e.
> ar->wmi.vdev_param->protection_mode in mac.c is either set to 1 or 0
> (depending upon use_cts_prot), but not 2. This probably seems not
> helpful in hidden node scenarios as the CTS frame is unicasted instead
> broadcasting.
>
> I would appreciate any pointers on completely disabling RTS/CTS as
> well as the ability to choose between complete RTS/CTS versus
> CTS-to-self whenever RTS/CTS is enabled.
Which mode is this? For aggregated frames (AMPDU) RTS Threshold is
not checked, so it can still be enabled

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
