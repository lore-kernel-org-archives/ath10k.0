Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imsRn-0007M7-64
 for ath10k@lists.infradead.org; Thu, 02 Jan 2020 04:51:02 +0000
MIME-Version: 1.0
Date: Wed, 01 Jan 2020 20:50:49 -0800
From: wgong@codeaurora.org
Subject: Re: [PATCH v2 2/2] ath10k: start recovery process when payload length
 exceeds max htc length for sdio
In-Reply-To: <CAMrEMU9ZVV-yotvH2Odn+sb1HiiL_tN_GASSeSnhAOzCUjLZ7Q@mail.gmail.com>
References: <20191225120002.11163-1-wgong@codeaurora.org>
 <20191225120002.11163-3-wgong@codeaurora.org>
 <CAMrEMU9ZVV-yotvH2Odn+sb1HiiL_tN_GASSeSnhAOzCUjLZ7Q@mail.gmail.com>
Message-ID: <8ad12580aae4ed23778693dd483144db@codeaurora.org>
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
To: Justin Capella <justincapella@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

On 2019-12-25 14:56, Justin Capella wrote:
> Does the SDIO bus require addresses to be word aligned like the PCI
> bus does? I'm thinking of how netdev alloc uses skb_push to ensure
> that the payload is aligned.
> 
> 
>>> if (ar->state == ATH10K_STATE_ON)
> 
> What about the other STATEs: RESTARTED/ING
> 
> The value you mentioned 57005, is 0xDEAD is that a special case?
> Perhaps a result of fw crash? Maybe a lookahead gone wong? I see its
> the WMI PEER ALIVE/DEAD indicator but I'm not sure why it would be
> trailer of the other
> 
i have removed "if (ar->state == ATH10K_STATE_ON)"
and v3 sent:
patch v3:
https://patchwork.kernel.org/patch/11313853/
https://patchwork.kernel.org/patch/11313859/

>> 2.23.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
