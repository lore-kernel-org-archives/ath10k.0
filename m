Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEt7M-0003hn-8L
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 10:09:09 +0000
MIME-Version: 1.0
Date: Fri, 12 Apr 2019 18:09:03 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH v2] fq: fix fq_tin tx bytes overflow
In-Reply-To: <717acf1bde5507f73436ae7d45d114b34aee1c05.camel@sipsolutions.net>
References: <1552446505-15444-1-git-send-email-yiboz@codeaurora.org>
 (sfid-20190313_040846_202389_4E584F4C)
 <13392e1203be4ddd97c4e0e6b6a6c48ce97aae6f.camel@sipsolutions.net>
 <fa575f93f3936aa3be1cf6b14f87e511@codeaurora.org>
 <717acf1bde5507f73436ae7d45d114b34aee1c05.camel@sipsolutions.net>
Message-ID: <dba1c91baf387a5e44743075ec7efbc2@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless-owner@vger.kernel.org, =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-04-09 04:01, Johannes Berg wrote:
> On Mon, 2019-03-18 at 12:59 +0800, Yibo Zhao wrote:
>> 
>> I understand your concern. Yes, I am using high end AP for throughput
>> test. I'd say 1.2 Gbps is not the worst case since we can achieve max
>> 1.4Gbps according to our test. AFAIK, for most throughput cases, 1min 
>> is
>> the minimum requirement. And I think, with more and more high end
>> products(even higher throughput) on the ways to the market, it is 
>> highly
>> possible that 30s is not a safe time before overflow.
> 
> Well, 2 Gbps (goodput) would make it overflow every 16 seconds, so I'm
> not sure where you take the 1 minute from :-) Maybe from 1.2Gbps PHY
> rate.
> 
> But still, the only place we expose this is debugfs, so I'm not really
> sure we want to spend that.
> 
> Note that I'm generally pushing back on statistics right now - I really
> want to put some trace points or eBPF hooks in places that people can
> use to keep their favourite statistics, instead of trying to cover each
> and every use case in the stack itself.

Cool, great!looking forward to that change. :-)
> 
> johannes

-- 
Yibo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
