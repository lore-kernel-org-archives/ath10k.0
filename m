Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ww3GT-0001XS-Rp
 for ath10k@lists.infradead.org; Sun, 15 Jun 2014 05:46:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: After shutdown/restart, ath10k sometimes stops receiving packets
References: <CAHqTa-1EDoRwSXWx4JQ_JSpF1_60B3fn=KecE4mDCrLrDJ5odw@mail.gmail.com>
 <878uoz4eza.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1MGGFK50sO=JAswMZLA0=Yy8AH4g0ziLr6+RK2R57jFg@mail.gmail.com>
Date: Sun, 15 Jun 2014 08:45:34 +0300
In-Reply-To: <CAHqTa-1MGGFK50sO=JAswMZLA0=Yy8AH4g0ziLr6+RK2R57jFg@mail.gmail.com>
 (Avery Pennarun's message of "Sat, 14 Jun 2014 14:40:59 -0400")
Message-ID: <87vbs23ev5.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> On Sat, Jun 14, 2014 at 12:45 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Avery Pennarun <apenwarr@gmail.com> writes:
>>> We are experiencing a relatively-rare-but-not-rare-enough case which
>>> has approximately these steps:
>>>
>>> - run a wifi AP for a while with a station or two connected
>>> - shut down hostapd (stations all get disconnected of course)
>>> - restart hostapd (perhaps on another channel or with different settings)
>>>
>>> After that, an external wifi sniffer can see beacons being transmitted
>>> by the AP as expected, but all packets from stations trying to connect
>>> are ignored.
>>
>> Do you have any guesses how often this happens? Once a day, once a week?
>
> Someone in our QA group seems to be able to produce it after two or
> three test runs with Veriwave.  Before each run, he stops and restarts
> hostapd.

That's quite often. Was he testing DFS or something else? Maybe this is
related to radar detection or channel switching?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
