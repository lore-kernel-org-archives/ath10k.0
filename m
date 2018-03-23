Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezMzj-0001Vm-Bi
 for ath10k@lists.infradead.org; Fri, 23 Mar 2018 13:44:58 +0000
Message-ID: <1521812659.28252.0.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: Implement get_expected_throughput callback
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 23 Mar 2018 14:44:19 +0100
In-Reply-To: <5434de1a4bcdf7341fdeb766e7638760@codeaurora.org>
 (sfid-20180323_144153_352630_7377CAE0)
References: <1521790620-12267-1-git-send-email-akolli@codeaurora.org>
 <2667699.TbZPxW0hJB@bentobox>
 <5434de1a4bcdf7341fdeb766e7638760@codeaurora.org>
 (sfid-20180323_144153_352630_7377CAE0)
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
To: akolli@codeaurora.org, Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Johannes Berg <johannes.berg@intel.com>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Antonio Quartulli <a@unstable.cc>, ath10k@lists.infradead.org, Tamizh chelvam <tamizhr@codeaurora.org>, Felix Fietkau <nbd@nbd.name>

On Fri, 2018-03-23 at 19:11 +0530, akolli@codeaurora.org wrote:
> 
> > > +
> > > +       sinfo->expected_throughput =
> > > +                               
> > > ewma_sta_txrate_read(&arsta->ave_sta_txrate);
> > > +       sinfo->filled |=
> > > BIT(NL80211_STA_INFO_EXPECTED_THROUGHPUT);
> > > +}

> Yes. This looks redundant, I will remove this line,
>   sinfo->filled |= BIT(NL80211_STA_INFO_EXPECTED_THROUGHPUT);

You don't need any of the changes here in ath10k_sta_statistics().

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
