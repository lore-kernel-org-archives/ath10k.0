Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLU5v-00045P-Ok
 for ath10k@lists.infradead.org; Thu, 24 Sep 2020 16:27:44 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: sdio: remove redundant check in for loop
References: <c2987351e3bdad16510dd35847991c2412a9db6b.camel@nvidia.com>
 <20200916165748.20927-1-alex.dewar90@gmail.com>
 <CAGRGNgWoFfCnK9FcWTf_f0b57JNEjsm6ZNQB5X_AMf8L3FyNcQ@mail.gmail.com>
Date: Thu, 24 Sep 2020 19:27:36 +0300
In-Reply-To: <CAGRGNgWoFfCnK9FcWTf_f0b57JNEjsm6ZNQB5X_AMf8L3FyNcQ@mail.gmail.com>
 (Julian Calaby's message of "Thu, 17 Sep 2020 10:45:33 +1000")
Message-ID: <87h7rnnnrb.fsf@codeaurora.org>
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
To: Julian Calaby <julian.calaby@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, Alex Dewar <alex.dewar90@gmail.com>

Julian Calaby <julian.calaby@gmail.com> writes:

> On Thu, Sep 17, 2020 at 3:09 AM Alex Dewar <alex.dewar90@gmail.com> wrote:
>>
>> The for loop checks whether cur_section is NULL on every iteration, but
>> we know it can never be NULL as there is another check towards the
>> bottom of the loop body. Refactor to avoid this unnecessary check.
>>
>> Also, increment the variable i inline for clarity
>
> Comments below.
>
>> Addresses-Coverity: 1496984 ("Null pointer dereferences)
>> Suggested-by: Saeed Mahameed <saeedm@nvidia.com>
>> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
>> ---
>> v2: refactor in the manner suggested by Saeed
>>
>>  drivers/net/wireless/ath/ath10k/sdio.c | 12 +++---------
>>  1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
>> index 81ddaafb6721..486886c74e6a 100644
>> --- a/drivers/net/wireless/ath/ath10k/sdio.c
>> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
>> @@ -2307,8 +2307,8 @@ static int ath10k_sdio_dump_memory_section(struct ath10k *ar,
>>         }
>>
>>         count = 0;
>> -
>> -       for (i = 0; cur_section; i++) {
>> +       i = 0;
>> +       for (; cur_section; cur_section = next_section) {
>
> You can have multiple statements in each section of a for() if you need to, e.g.
>
> for (i = 1; cur_section; cur_section = next_section, i++) {
>
> which means that the increment of i isn't hidden deep in the function body.

Yeah, I was thinking the same. But I'll apply this patch anyway, it's
still an improvement.

> That said, this function is a mess. Something (approximately) like
> this might be more readable:
>
> prev_end = memregion->start;
> for (i = 0; i < mem_region->section_table.size; i++) {
>     cur_section = &mem_region->section_table.sections[i];
>
>     // fail if prev_end is greater than cur_section->start - message
> from line 2329 and 2294
>     // check section size - from line 2315
>
>     skip_size = cur_section->start - prev_end;
>
>     // check buffer size - from line 2339 - needs to account for the
> skip size too.
>     // fill in the skip size amount - from line 2358 and 2304
>     // ath10k_sdio_read_mem - from line 2346
>
>     prev_end = cur_section->end;
> }

I agree. Anyone can come up with a patch?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
