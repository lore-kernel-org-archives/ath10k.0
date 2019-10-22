Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMypt-0007OV-SY
 for ath10k@lists.infradead.org; Tue, 22 Oct 2019 18:24:51 +0000
Received: by mail-qk1-f194.google.com with SMTP id m4so260080qke.9
 for <ath10k@lists.infradead.org>; Tue, 22 Oct 2019 11:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
 <d6cfd945-7bab-a01d-0157-e0e1802f66e3@eero.com>
In-Reply-To: <d6cfd945-7bab-a01d-0157-e0e1802f66e3@eero.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 22 Oct 2019 11:24:36 -0700
Message-ID: <CAJ-VmonXbUQ=Gv9fBbpN+ez25c3Pz+xxLoL67etMdC0Q+bwyXg@mail.gmail.com>
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
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
To: Peter Oh <peter.oh@eero.com>
Cc: Zhi Chen <zhichen@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

On Tue, 22 Oct 2019 at 10:17, Peter Oh <peter.oh@eero.com> wrote:
>
>
> On 10/22/19 1:57 AM, Zhi Chen wrote:
> > This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
> > PCIe hung issue was observed on multiple platforms. The issue was reproduced
> > when DUT was configured as AP and associated with 50+ STAs.
> >
> > With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary when
> > issue happened. It broke PCIe spec and caused PCIe stuck.
>
> How can you say value 0 (I believe it's 64 bytes) DMA burst size causes
> the symptom and 1 fixes it?


+1 to this question.

Also, shouldn't the DMA engine be doing what the firmware says? Is the
firmware/copy engine actually somehow bursting / prefetching across a
4K page boundary?

Surely this is something that can be fixed in software/firmware by
correctly configuring up buffer size/offsets?



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
