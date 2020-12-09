Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmvVA-0000sB-DF
 for ath10k@lists.infradead.org; Wed, 09 Dec 2020 09:11:13 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: add flag to protect napi operation to avoid
 dead loop hang
References: <1598617348-2325-1-git-send-email-wgong@codeaurora.org>
 <CABPxzYKOCtA0n=bTHXT5VdsTGHcVc5PEvS2-TnGD9XEKCWdrNQ@mail.gmail.com>
Date: Wed, 09 Dec 2020 11:11:01 +0200
In-Reply-To: <CABPxzYKOCtA0n=bTHXT5VdsTGHcVc5PEvS2-TnGD9XEKCWdrNQ@mail.gmail.com>
 (Krishna Chaitanya's message of "Fri, 28 Aug 2020 19:39:11 +0530")
Message-ID: <87wnxrbaze.fsf@codeaurora.org>
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
To: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

Krishna Chaitanya <chaitanya.mgit@gmail.com> writes:

> On Fri, Aug 28, 2020 at 5:53 PM Wen Gong <wgong@codeaurora.org> wrote:
>>
>> It happened "Kernel panic - not syncing: hung_task: blocked tasks" when
>> test simulate crash and ifconfig down/rmmod meanwhile.

(editing out hundreds of lines of unnecessary text, please edit your quotes)

> LGTM, except maybe a shorted title "ath10k: Prevent deinitializing NAPI twice".

Thanks, I fixed the title in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
