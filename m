Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMxmG-0007LH-D0
 for ath10k@lists.infradead.org; Tue, 22 Oct 2019 17:17:01 +0000
Received: by mail-pg1-x542.google.com with SMTP id f14so10317501pgi.9
 for <ath10k@lists.infradead.org>; Tue, 22 Oct 2019 10:16:59 -0700 (PDT)
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <d6cfd945-7bab-a01d-0157-e0e1802f66e3@eero.com>
Date: Tue, 22 Oct 2019 10:16:53 -0700
MIME-Version: 1.0
In-Reply-To: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Zhi Chen <zhichen@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org


On 10/22/19 1:57 AM, Zhi Chen wrote:
> This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
> PCIe hung issue was observed on multiple platforms. The issue was reproduced
> when DUT was configured as AP and associated with 50+ STAs.
>
> With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary when
> issue happened. It broke PCIe spec and caused PCIe stuck.

How can you say value 0 (I believe it's 64 bytes) DMA burst size causes 
the symptom and 1 fixes it?

Peter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
