Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imsNg-0005eg-LO
 for ath10k@lists.infradead.org; Thu, 02 Jan 2020 04:46:46 +0000
MIME-Version: 1.0
Date: Wed, 01 Jan 2020 20:46:40 -0800
From: wgong@codeaurora.org
Subject: Re: [PATCH v2 1/2] ath10k: add refcount for ath10k_core_restart
In-Reply-To: <CAMrEMU_eLfD6=7esrYJA4GnU=CcWgBey1QZL+-=RVoRUUcfZKw@mail.gmail.com>
References: <20191225120002.11163-1-wgong@codeaurora.org>
 <20191225120002.11163-2-wgong@codeaurora.org>
 <CAMrEMU-p3+HRZYW6TzXwZSwhxj9oJ9JW1Rg=ZysJ3fr0rm45Ng@mail.gmail.com>
 <5f6eb95de0f877b86b90d0c32d458d43@codeaurora.org>
 <CAMrEMU_eLfD6=7esrYJA4GnU=CcWgBey1QZL+-=RVoRUUcfZKw@mail.gmail.com>
Message-ID: <37eab887aaa350be0489f7e19f17d024@codeaurora.org>
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
To: Justin Capella <justincapella@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

On 2020-01-01 19:10, Justin Capella wrote:
> Instead of the atomic restart count, can the state be updated to
> ATH10K_STATE_RESTARTING while holding
>      mutex_unlock(&ar->conf_mutex);
> 
the recovery process is begin with ath10k_core_restart, and end with 
ath10k_reconfig_complete.
I already see it has mutex_lock(&ar->conf_mutex) and 
mutex_unlock(&ar->conf_mutex) in ath10k_core_restart,
but it is not enough, for example:
1st recovery has finished ath10k_core_restart, but not arrive 
ath10k_reconfig_complete, then the 2nd recovery
begin to enter ath10k_core_restart, it will destroy the 1st recovery and 
let 1st recovery fail.
After apply this patch, after recovery about 18000+ times, and still can 
connect/scan/ping success.

> I don't understand the bundles, but I wonder about the case when there
> are multiple packets (n_rx_pkts) and if pkt_bundle_len might be the
> one to check. Also if there needs to be a check that the len > sizeof
> HTC HDR.
> 
the htc_hdr->len is len of payload, so it allow < sizeof HTC HDR, but 
not allow > ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
pkt_bundle is only used when it has many packet in rx side, otherwise it 
is not bundled in rx.

patch v3:
https://patchwork.kernel.org/patch/11313853/
https://patchwork.kernel.org/patch/11313859/

> On Tue, Dec 31, 2019 at 1:37 AM <wgong@codeaurora.org> wrote:
>> 
>> On 2019-12-25 23:14, Justin Capella wrote:
>> > This does not only effect SDIO.
>> >
>> > Why a semaphore / count? Could the conf_mutex be held earlier, or
>> > perhaps change the state to ATH10K_STATE_RESTARTING first?
>> > ath10k_reconfig_complete is also called in mac.c when channel is
>> > changed so
>> patch v2:
>> https://patchwork.kernel.org/patch/11313853/
>> https://patchwork.kernel.org/patch/11313859/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
