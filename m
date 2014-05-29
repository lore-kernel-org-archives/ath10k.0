Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wpzog-0001LE-Fa
 for ath10k@lists.infradead.org; Thu, 29 May 2014 12:52:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC PATCH 2/2] ath10k: add testmode
References: <20140528091832.8030.93169.stgit@potku.adurom.net>
 <20140528091956.8030.46201.stgit@potku.adurom.net>
 <CA+BoTQnLPua6Mds+ywPY==9QtnHbuucVamDYpWnfwKiC7J=9dQ@mail.gmail.com>
Date: Thu, 29 May 2014 15:51:48 +0300
In-Reply-To: <CA+BoTQnLPua6Mds+ywPY==9QtnHbuucVamDYpWnfwKiC7J=9dQ@mail.gmail.com>
 (Michal Kazior's message of "Thu, 29 May 2014 13:43:42 +0200")
Message-ID: <87ha48693v.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Michal,

BTW, please edit your quotes. It's pain to find your comments from a 700
line monster :)

Michal Kazior <michal.kazior@tieto.com> writes:

> On 28 May 2014 11:19, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> +/* skb owned by the caller, must not sleep */
>> +void ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
>> +{
>> +       struct sk_buff *nl_skb;
>> +       int ret;
>> +
>> +       ath10k_dbg(ATH10K_DBG_TESTMODE,
>> +                  "testmode event wmi cmd_id %d skb %p skb->len %d\n",
>> +                  cmd_id, skb, skb->len);
>> +
>> +       ath10k_dbg_dump(ATH10K_DBG_TESTMODE, NULL, "", skb->data, skb->len);
>> +
>> +       /* FIXME: locking! */
>> +
>> +       if (ar->state != ATH10K_STATE_UTF)
>> +               return;
>
> You shouldn't really be depending on the value of ar->state without
> conf_mutex being held.
>
> Since this is tasklet context you can't just grab the mutex here.
>
> The simplest way is to probably to move this into a worker and a have
> sk_buff_head.

Yeah, this is what I was planning to do.

> Another way is to rework the state system to be async (it might be
> easier to do now after my recent hw restart changes) and have
> ar->state be protected only by ar->data_lock. This might be tricky
> though. I'll take a look at it..

Please don't waste time on that, unless there are other advantages. This
testmode interface is no way performance critical and workqueue is more
than adequate.

>> +       if (ar->testmode.utf != NULL)
>> +               /* utf is already loaded */
>> +               goto power_up;
>> +
>> +
>> +       snprintf(filename, sizeof(filename), "%s/%s",
>> +                ar->hw_params.fw.dir, ATH10K_FW_UTF_FILE);
>
> 1 extraneous empty line.

Will fix.

>> +       ath10k_dbg(ATH10K_DBG_TESTMODE,
>> +                  "testmode cmd wmi cmd_id %d buf %p buf_len %d\n",
>> +                  cmd_id, buf, buf_len);
>> +
>> +       ath10k_dbg_dump(ATH10K_DBG_TESTMODE, NULL, "", buf, buf_len);
>> +
>> +       skb = ath10k_wmi_alloc_skb(buf_len);
>
> if (!skb) return -ENOMEM; ?

Yup.

>> +int ath10k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
>> +                 void *data, int len)
>> +{
>> +       struct ath10k *ar = hw->priv;
>> +       struct nlattr *tb[ATH10K_TM_ATTR_MAX + 1];
>> +       int err;
>> +
>> +       err = nla_parse(tb, ATH10K_TM_ATTR_MAX, data, len,
>> +                       ath10k_tm_policy);
>> +       if (err)
>> +               return err;
>
> s/err/ret/ ?

Yes, I'll change that.

>> +void ath10k_testmode_unregister(struct ath10k *ar)
>> +{
>> +       /* FIXME: locking! */
>
> I think this should be protected by conf_mutex.

Yeah, that's why I have the FIXME :)

>> +
>> +       release_firmware(ar->testmode.utf);
>
> It might be a good idea to ar->testmode.utf = NULL ?

I agree.

>> +       if (ar->state != ATH10K_STATE_UTF)
>> +               /* utf firmware is not running */
>> +               return;
>> +
>> +       ath10k_htc_stop(&ar->htc);
>> +       ath10k_wmi_detach(ar);
>
> Why not ath10k_core_stop() ?

Doh, I can't remember anymore. Maybe because of the htt calls? But I
agree, we should call core_stop() for symmetry. I'll investigate.

>> @@ -2333,6 +2338,7 @@ static void ath10k_wmi_10x_process_rx(struct ath10k *ar, struct sk_buff *skb)
>>
>>  static void ath10k_wmi_process_rx(struct ath10k *ar, struct sk_buff *skb)
>>  {
>> +       /* FIXME: somehow force ot use 10x with UTF */
>
> `ot`: typo?

Yeah. And the FIXME will be gone in the final version, this was just an
RFC to get early comments on the design.

> I'm a little confused how this works. When UTF firmware is loaded does
> it generate regular WMI events? Or does it generate UTF_EVENTID only?

Only UTF_EVENTID, at least for now.

> Is there a particular reason for ath10k_tm_event_wmi() to be called
> before the switch() and have it no effect on processing of the event
> later whatsoever?

I want to send the full WMI packet (instead of UTF_EVENTID) to user
space to make it easier to extend this later, in case there will be a
need for that in the future. For example, there can be new event ids and
whatnot. The less we need to change the user space interface the easier
it will be.

> Maybe we don't need to check for ar->state==UTF at all?

That's a good idea, I'll explore how to do that. One way is to just have
a new boolean to control if wmi events should be delivered to user space
or not. I would not be surprised if at some point we would want to use
the testmode WMI interface also in "normal mode".

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
