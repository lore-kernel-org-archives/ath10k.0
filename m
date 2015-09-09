Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f176.google.com ([209.85.223.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZiZW-0005zA-Ok
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 16:50:11 +0000
Received: by ioiz6 with SMTP id z6so29181731ioi.2
 for <ath10k@lists.infradead.org>; Wed, 09 Sep 2015 09:49:46 -0700 (PDT)
Date: Wed, 9 Sep 2015 12:49:45 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH 3/3] ath10k: implement mesh support
Message-ID: <20150909164945.GA4062@localhost>
References: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
 <1440673024-13696-4-git-send-email-me@bobcopeland.com>
 <87oahc9g9h.fsf@kamboji.qca.qualcomm.com>
 <87fv2o9cvl.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fv2o9cvl.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, Sep 09, 2015 at 12:10:38PM +0300, Kalle Valo wrote:
> > I did a quick smoke test and saw the splat below. It's this warning from
> > cfg80211:
> >
> > 			/*
> > 			 * Don't advertise an unsupported type
> > 			 * in a combination.
> > 			 */
> > 			if (WARN_ON((wiphy->interface_modes & types) != types))
> > 				return -EINVAL;

OK, this happens when mesh is configured out (we mask off the mesh
interface_modes internally but not the types).  Sent an updated version
with appropriate ifdefs added.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
