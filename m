Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAVj8-0007S5-PZ
 for ath10k@lists.infradead.org; Tue, 25 Aug 2020 09:58:52 +0000
MIME-Version: 1.0
Date: Tue, 25 Aug 2020 17:58:44 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: add flag to protect napi operation to avoid
 dead loop hang for SDIO
In-Reply-To: <CABPxzYJ982LdcUD3a_tyu3rrqp+iacZrmAp4zG_3HqCiDCR_2w@mail.gmail.com>
References: <1598243612-4627-1-git-send-email-wgong@codeaurora.org>
 <CABPxzYLjys+cXXRM5J680ZOs+6VrYt=_3rWv-gqkCod=-A1VrA@mail.gmail.com>
 <fd98989a87f2a50655dc95bdcd535c0d@codeaurora.org>
 <CABPxzYKvPwtQwxMfRcv9jT+d92ErhYGR91SKBH86T3Rd2QH9Qg@mail.gmail.com>
 <2d6362ce85956d0f7df2e596b89a7028@codeaurora.org>
 <CABPxzY+Fc22ke1ygRnDs0Uds0a7n=792QN8ALXciDrnx9SQuqQ@mail.gmail.com>
 <663fbb682fd8df555b2964d7d86b8eca@codeaurora.org>
 <CABPxzYJ982LdcUD3a_tyu3rrqp+iacZrmAp4zG_3HqCiDCR_2w@mail.gmail.com>
Message-ID: <02d7cee8e356ad7326f8631ba2f97a2c@codeaurora.org>
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

On 2020-08-25 16:24, Krishna Chaitanya wrote:
> On Tue, Aug 25, 2020 at 9:11 AM Wen Gong <wgong@codeaurora.org> wrote:
>> 
>> On 2020-08-24 19:15, Krishna Chaitanya wrote:
>> > On Mon, Aug 24, 2020 at 4:15 PM Wen Gong <wgong@codeaurora.org> wrote:
>> >>
>> >> On 2020-08-24 18:03, Krishna Chaitanya wrote:
>> >> > On Mon, Aug 24, 2020 at 3:10 PM Wen Gong <wgong@codeaurora.org> wrote:
>> >> >>
>> >> >> On 2020-08-24 16:35, Krishna Chaitanya wrote:
>> >> >> > On Mon, Aug 24, 2020 at 10:03 AM Wen Gong <wgong@codeaurora.org> wrote:
>> >> >> >>
>> >> >> >> It happened "Kernel panic - not syncing: hung_task: blocked tasks"
>> >> >> >> when
>> >> >> >> test simulate crash and ifconfig down/rmmod meanwhile.
>> >> >> >>
>> >> >> ...
>> >> >> >>
>> >> >> >>  #ifdef CONFIG_PM
>> >> >> > Even though your DUT is SDIO based we should be doing this in general
>> >> >> > for all, no?
>> >> >> > core_restart + hif_stop is common to all.
>> >> >> this patch does not have core_restart.
>> >> > I was referring to the combination which is causing the issue.
>> >> >
>> >> >> I dit not hit the issue for others bus(PCIe,SNOC...), so I can not
>> >> >> change them with a
>> >> >> assumption they also have this issue.
>> >> > But that doesn't make sense, the combination is being hit for others
>> >> > also.
>> >> > (they should also endup calling napi_disable twice?) or they are using
>> >> > some other check to avoid this (doesn't appear so from a quick look at
>> >> > the
>> >> > code).
>> >> Because I only use SDIO, I did not use others BUS, so I did not hit
>> >> the
>> >> issue
>> >> on other BUS.
>> > I understand, my point was based on the description the issue looks
>> > independent
>> > of the BUS type, so, the fix should also be generic. I understand that
>> > your testing
>> > is only focused on SDIO, but we should have a generic fix and probably
>> > use
>> > communities help to get it tested rather than fixing SDIO only.
>> I checked the ath10k, only sdio.c, snoc.c, pci.c have used napi.
>> I think it can change to move the
>> napi_synchronize/napi_disable/napi_enable from
>> sido.c/snoc.c/pci.c to ath10k_core.ko as below:
>> void ath10k_core_napi_enable(struct ath10k *ar)
>> {
>>         if (!ar->napi_enabled) {
>>                 napi_enable(&ar->napi);
>>                 ar->napi_enabled = true;
>>         }
>> }
>> EXPORT_SYMBOL(ath10k_core_napi_enable);
>> 
>> void ath10k_core_napi_disable_sync(struct ath10k *ar)
>> {
>>         if (ar->napi_enabled) {
>>                 napi_synchronize(&ar->napi);
>>                 napi_disable(&ar->napi);
>>                 ar->napi_enabled = false;
>>         }
>> }
>> EXPORT_SYMBOL(ath10k_core_napi_disable_sync);
>> 
>> is it appropriate?
>> ...
> Yes, this is perfect. One minor comment you can just do the
> check initially and return.
> 
> if (ar->napi_enabled)
>    return
Yes, I will change that.
But who can test for SNOC and PCIe, I have tested with SDIO, it is OK.
Govind, could you help to test SNOC?
If no people test PCIe, I can also test it.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
