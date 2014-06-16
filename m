Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwTFM-0003yZ-Ua
 for ath10k@lists.infradead.org; Mon, 16 Jun 2014 09:30:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: After shutdown/restart, ath10k sometimes stops receiving packets
References: <CAHqTa-1EDoRwSXWx4JQ_JSpF1_60B3fn=KecE4mDCrLrDJ5odw@mail.gmail.com>
 <878uoz4eza.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1MGGFK50sO=JAswMZLA0=Yy8AH4g0ziLr6+RK2R57jFg@mail.gmail.com>
 <87vbs23ev5.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-32qgA7y6-+FKV117gGGqY7LO+=vjB4wURh31NP+cV2cg@mail.gmail.com>
Date: Mon, 16 Jun 2014 12:30:07 +0300
In-Reply-To: <CAHqTa-32qgA7y6-+FKV117gGGqY7LO+=vjB4wURh31NP+cV2cg@mail.gmail.com>
 (Avery Pennarun's message of "Sun, 15 Jun 2014 02:49:25 -0400")
Message-ID: <87bntt2odc.fsf@kamboji.qca.qualcomm.com>
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

> On Sun, Jun 15, 2014 at 1:45 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Avery Pennarun <apenwarr@gmail.com> writes:
>>> Someone in our QA group seems to be able to produce it after two or
>>> three test runs with Veriwave.  Before each run, he stops and restarts
>>> hostapd.
>>
>> That's quite often. Was he testing DFS or something else? Maybe this is
>> related to radar detection or channel switching?
>
> He's not using DFS channels.

Good, so we can rule out that.

> This is supposedly just a simple throughput test. (Although I've
> noticed in the past that the Veriwave sometimes produces odd sequences
> of packets.)

Yeah, these kind of test equipments can behave different than normal
802.11 devices. For example, I remember one very expensive test box was
acting as an AP and it just ignored PM bit from the clients. No wonder
the packet loss was high :)

In this case it might that the way Veriwave behaves so which makes it
easy to reproduce the bug. And that's a good thing.

Any chance you could get full trace-cmd logs (ath10k, mac80211, cfg80211
and hostapd) when the bug fails with Veriwave? I'm sure that would get
more hints what's happening.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
