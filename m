Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZuhh-0001Ed-HP
 for ath10k@lists.infradead.org; Thu, 10 Sep 2015 05:47:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: implement mesh support
References: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
 <1440673024-13696-4-git-send-email-me@bobcopeland.com>
 <87oahc9g9h.fsf@kamboji.qca.qualcomm.com>
 <87fv2o9cvl.fsf@kamboji.qca.qualcomm.com>
 <20150909164945.GA4062@localhost>
Date: Thu, 10 Sep 2015 08:46:54 +0300
In-Reply-To: <20150909164945.GA4062@localhost> (Bob Copeland's message of
 "Wed, 9 Sep 2015 12:49:45 -0400")
Message-ID: <87oaha4yi9.fsf@kamboji.qca.qualcomm.com>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bob Copeland <me@bobcopeland.com> writes:

> On Wed, Sep 09, 2015 at 12:10:38PM +0300, Kalle Valo wrote:
>> > I did a quick smoke test and saw the splat below. It's this warning from
>> > cfg80211:
>> >
>> > 			/*
>> > 			 * Don't advertise an unsupported type
>> > 			 * in a combination.
>> > 			 */
>> > 			if (WARN_ON((wiphy->interface_modes & types) != types))
>> > 				return -EINVAL;
>
> OK, this happens when mesh is configured out (we mask off the mesh
> interface_modes internally but not the types).  Sent an updated version
> with appropriate ifdefs added.

Indeed, when I enabled CONFIG_MAC80211_MESH I didn't see the WARN_ON()
anymore. (I haven't tested your latest version yet, will do it soon)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
