Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDxuC-00027v-DM
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 15:08:49 +0000
Received: by mail-la0-f52.google.com with SMTP id c6so8097638lan.25
 for <ath10k@lists.infradead.org>; Thu, 13 Feb 2014 07:08:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87ppmr83p4.fsf@kamboji.qca.qualcomm.com>
References: <1392052405-15337-1-git-send-email-marek.puzyniak@tieto.com>
 <CA+BoTQ=q-940AsMfneU5SP8Ke1RxEZE12rrm4Z+KBaTBjrW64w@mail.gmail.com>
 <87ppmr83p4.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 13 Feb 2014 16:08:19 +0100
Message-ID: <CADnKcViJDsL6iTuKJ-QzHp-s1acE=89x6F1OXm1Ja8YAae09ng@mail.gmail.com>
Subject: Re: [PATCH] ath10k: change simulate_fw_crash to work with 10.1
 firmware
From: Marek Puzyniak <marek.puzyniak@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 13 February 2014 15:52, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> On 10 February 2014 18:13, Marek Puzyniak <marek.puzyniak@tieto.com> wrote:
>>> Wmi command WMI_FORCE_FW_HANG_CMDID is not supported
>>> in firmware 10.1. In order to have firmware crash simulation
>>> functionality also in firmware 10.1 driver can force firmware
>>> crash by performing not allowed operation. Driver can deliberately
>>> crash firmware when setting vdev param for vdev id out of range.
>>>
>>> Command to trigger firmware crash:
>>> echo "crash" > /sys/kernel/debug/ieee80211/phyX/ath10k/simulate_fw_crash
>>>
>>> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
>>> ---
>>
>> The 'fw hang assert' crash can be recovered with a warm reset but a
>> real crash can't.
>
> Oh, I didn't know that.
>
>> Thus, I think the two crash methods should be distinguishable
>
> Yeah, I agree.
>
>> by having either two separate debugfs files or two separate trigger
>> keywords.
>
> I think having a keyword would be a better to way differentiate these.
> And if the firmware doesn't support WMI_FORCE_FW_HANG_ASSERT, then just
> return -EOPNOTSUPP.

I will send new version with different keyword for different kind of
firmware crash.

Marek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
