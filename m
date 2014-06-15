Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22c.google.com ([2607:f8b0:400c:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ww4GV-0000Xe-FT
 for ath10k@lists.infradead.org; Sun, 15 Jun 2014 06:50:07 +0000
Received: by mail-vc0-f172.google.com with SMTP id hy10so3824464vcb.31
 for <ath10k@lists.infradead.org>; Sat, 14 Jun 2014 23:49:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87vbs23ev5.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-1EDoRwSXWx4JQ_JSpF1_60B3fn=KecE4mDCrLrDJ5odw@mail.gmail.com>
 <878uoz4eza.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1MGGFK50sO=JAswMZLA0=Yy8AH4g0ziLr6+RK2R57jFg@mail.gmail.com>
 <87vbs23ev5.fsf@kamboji.qca.qualcomm.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Sun, 15 Jun 2014 02:49:25 -0400
Message-ID: <CAHqTa-32qgA7y6-+FKV117gGGqY7LO+=vjB4wURh31NP+cV2cg@mail.gmail.com>
Subject: Re: After shutdown/restart, ath10k sometimes stops receiving packets
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

On Sun, Jun 15, 2014 at 1:45 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>> Someone in our QA group seems to be able to produce it after two or
>> three test runs with Veriwave.  Before each run, he stops and restarts
>> hostapd.
>
> That's quite often. Was he testing DFS or something else? Maybe this is
> related to radar detection or channel switching?

He's not using DFS channels.  This is supposedly just a simple
throughput test.  (Although I've noticed in the past that the Veriwave
sometimes produces odd sequences of packets.)  It also happened to me
without Veriwave involved, on the open air, and definitely not on a
DFS channel.  But that only happened once and I didn't have a sniffer
going at the time.  I was definitely reconfiguring it to use a new
channel at the time.

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
