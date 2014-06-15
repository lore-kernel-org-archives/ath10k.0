Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwD3l-0003Rs-53
 for ath10k@lists.infradead.org; Sun, 15 Jun 2014 16:13:33 +0000
Message-ID: <539DC612.1000902@candelatech.com>
Date: Sun, 15 Jun 2014 09:13:06 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: After shutdown/restart, ath10k sometimes stops receiving packets
References: <CAHqTa-1EDoRwSXWx4JQ_JSpF1_60B3fn=KecE4mDCrLrDJ5odw@mail.gmail.com>
 <878uoz4eza.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1MGGFK50sO=JAswMZLA0=Yy8AH4g0ziLr6+RK2R57jFg@mail.gmail.com>
 <87vbs23ev5.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87vbs23ev5.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>



On 06/14/2014 10:45 PM, Kalle Valo wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>
>> On Sat, Jun 14, 2014 at 12:45 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>> Avery Pennarun <apenwarr@gmail.com> writes:
>>>> We are experiencing a relatively-rare-but-not-rare-enough case which
>>>> has approximately these steps:
>>>>
>>>> - run a wifi AP for a while with a station or two connected
>>>> - shut down hostapd (stations all get disconnected of course)
>>>> - restart hostapd (perhaps on another channel or with different settings)
>>>>
>>>> After that, an external wifi sniffer can see beacons being transmitted
>>>> by the AP as expected, but all packets from stations trying to connect
>>>> are ignored.
>>>
>>> Do you have any guesses how often this happens? Once a day, once a week?
>>
>> Someone in our QA group seems to be able to produce it after two or
>> three test runs with Veriwave.  Before each run, he stops and restarts
>> hostapd.
>
> That's quite often. Was he testing DFS or something else? Maybe this is
> related to radar detection or channel switching?

For my firmware, I hacked a WMI message to return some register values.

But, can they be read directly through the pci-e bus somehow (on stock firmware)?
It would be great to get a register dump for debugging stuff like this.

Could check the rx-filters and other such registers to see if there is
some pattern involved.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
