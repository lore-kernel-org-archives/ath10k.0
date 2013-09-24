Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOMKh-0004Wu-Mj
 for ath10k@lists.infradead.org; Tue, 24 Sep 2013 06:42:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 0/4] ath10k: improve RX performance
References: <1379335757-15180-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 24 Sep 2013 09:42:21 +0300
In-Reply-To: <1379335757-15180-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 16 Sep 2013 14:49:13 +0200")
Message-ID: <87mwn2bu0i.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This patchset gives clear RX performance
> improvement on AP135. Throughput is at least
> doubled (300mbps -> 600mbps, UDP RX, 2x2).
>
> Patches depend on my RFC patch "mac80211: support
> reporting A-MSDU subframes individually".

Preferably I can apply these changes only after the mac80211 patch goes
to net-next (to avoid unnecessary rebasing). Is there a way to
workaround the need for the mac80211 patch in ath10k so that we could
apply these patches ASAP? And once the mac80211 patch is commited we
could just remove the workaround in ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
