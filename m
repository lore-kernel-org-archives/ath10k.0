Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5kMZ-00038I-5C
 for ath10k@lists.infradead.org; Mon, 18 Mar 2019 04:59:04 +0000
MIME-Version: 1.0
Date: Mon, 18 Mar 2019 12:59:01 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH v2] fq: fix fq_tin tx bytes overflow
In-Reply-To: <13392e1203be4ddd97c4e0e6b6a6c48ce97aae6f.camel@sipsolutions.net>
References: <1552446505-15444-1-git-send-email-yiboz@codeaurora.org>
 (sfid-20190313_040846_202389_4E584F4C)
 <13392e1203be4ddd97c4e0e6b6a6c48ce97aae6f.camel@sipsolutions.net>
Message-ID: <fa575f93f3936aa3be1cf6b14f87e511@codeaurora.org>
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

On 2019-03-15 17:38, Johannes Berg wrote:
> On Wed, 2019-03-13 at 11:08 +0800, Yibo Zhao wrote:
>> Currently, we are using u32 for tx_bytes in fq_tin.
>> If the throughput stays more than 1.2Gbps, tx_bytes
>> statistics overflow in about 1 min.
>> 
>> In order to allow us to trace the tx_bytes statistics
>> for longer time in high throughput, change its type
>> from u32 to u64.
> 
> Hmm. 64-bit values are kinda expensive on 32-bit architectures. How
> badly do you need this? I mean ... worst case you just have to capture
> every 30 seconds or so if you're doing really high throughput with HE 
> or
> something?
> 
> johannes

Hi Johannes,

I understand your concern. Yes, I am using high end AP for throughput 
test. I'd say 1.2 Gbps is not the worst case since we can achieve max 
1.4Gbps according to our test. AFAIK, for most throughput cases, 1min is 
the minimum requirement. And I think, with more and more high end 
products(even higher throughput) on the ways to the market, it is highly 
possible that 30s is not a safe time before overflow.

-- 
Yibo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
