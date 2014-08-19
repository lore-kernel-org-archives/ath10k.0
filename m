Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22d.google.com ([2a00:1450:400c:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJcQ2-0002Yq-0I
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 05:57:18 +0000
Received: by mail-we0-f173.google.com with SMTP id q58so5939922wes.18
 for <ath10k@lists.infradead.org>; Mon, 18 Aug 2014 22:56:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
 <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 19 Aug 2014 01:56:35 -0400
Message-ID: <CAHqTa-1ZWg38dkT1N0fm3JkLL1kVc_pP1dsuCuorZxXm8z6M7Q@mail.gmail.com>
Subject: Re: Support for scan while in AP mode, and offchannel while in AP mode
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
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, Aug 19, 2014 at 1:50 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>> In the ath9k and several other drivers, commands like the following
>> work while in AP mode:
>>
>>   iw wlan0 scan -u ap-force passive
>> and
>>   iw wlan0 offchannel 2452  100
>>
>> On ath10k (using a driver from v3.15-rc1 as of April 13th), these tell
>> me the operation is not supported.
>
> Yeah, mac80211 only supports this with sw_scan but ath10k uses hw_scan.
> From ieee80211_alloc_hw():
>
>         if (!ops->hw_scan)
>                 wiphy->features |= NL80211_FEATURE_LOW_PRIORITY_SCAN |
>                                    NL80211_FEATURE_AP_SCAN;
>
>> Are there any plans to implement this feature?  It's important in
>> order to implement automatic channel change in case of changes in the
>> interference environment.
>
> No plans at the moment. Does anyone know how much work would it be to
> change mac80211 to support this with hw_scan?

Is there any particular reason it can't just resort to a sw_scan for
this use case?  What's the benefit of hw_scan?  I'm surprised there
would be any particular CPU time taken for such a thing.

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
