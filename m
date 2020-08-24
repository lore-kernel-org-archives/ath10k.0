Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA8xO-0004AA-VQ
 for ath10k@lists.infradead.org; Mon, 24 Aug 2020 09:40:04 +0000
MIME-Version: 1.0
Date: Mon, 24 Aug 2020 17:39:58 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: add flag to protect napi operation to avoid
 dead loop hang for SDIO
In-Reply-To: <CABPxzYLjys+cXXRM5J680ZOs+6VrYt=_3rWv-gqkCod=-A1VrA@mail.gmail.com>
References: <1598243612-4627-1-git-send-email-wgong@codeaurora.org>
 <CABPxzYLjys+cXXRM5J680ZOs+6VrYt=_3rWv-gqkCod=-A1VrA@mail.gmail.com>
Message-ID: <fd98989a87f2a50655dc95bdcd535c0d@codeaurora.org>
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
To: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 2020-08-24 16:35, Krishna Chaitanya wrote:
> On Mon, Aug 24, 2020 at 10:03 AM Wen Gong <wgong@codeaurora.org> wrote:
>> 
>> It happened "Kernel panic - not syncing: hung_task: blocked tasks" 
>> when
>> test simulate crash and ifconfig down/rmmod meanwhile.
>> 
...
>> 
>>  #ifdef CONFIG_PM
> Even though your DUT is SDIO based we should be doing this in general
> for all, no?
> core_restart + hif_stop is common to all.
this patch does not have core_restart.
I dit not hit the issue for others bus(PCIe,SNOC...), so I can not 
change them with a
assumption they also have this issue.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
