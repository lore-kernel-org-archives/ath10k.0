Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4jIk-0000KE-3F
 for ath10k@lists.infradead.org; Fri, 15 Mar 2019 09:38:56 +0000
Message-ID: <13392e1203be4ddd97c4e0e6b6a6c48ce97aae6f.camel@sipsolutions.net>
Subject: Re: [PATCH v2] fq: fix fq_tin tx bytes overflow
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 15 Mar 2019 10:38:48 +0100
In-Reply-To: <1552446505-15444-1-git-send-email-yiboz@codeaurora.org>
 (sfid-20190313_040846_202389_4E584F4C)
References: <1552446505-15444-1-git-send-email-yiboz@codeaurora.org>
 (sfid-20190313_040846_202389_4E584F4C)
Mime-Version: 1.0
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
To: Yibo Zhao <yiboz@codeaurora.org>, ath10k@lists.infradead.org
Cc: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>, linux-wireless@vger.kernel.org

On Wed, 2019-03-13 at 11:08 +0800, Yibo Zhao wrote:
> Currently, we are using u32 for tx_bytes in fq_tin.
> If the throughput stays more than 1.2Gbps, tx_bytes
> statistics overflow in about 1 min.
> 
> In order to allow us to trace the tx_bytes statistics
> for longer time in high throughput, change its type
> from u32 to u64.

Hmm. 64-bit values are kinda expensive on 32-bit architectures. How
badly do you need this? I mean ... worst case you just have to capture
every 30 seconds or so if you're doing really high throughput with HE or
something?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
