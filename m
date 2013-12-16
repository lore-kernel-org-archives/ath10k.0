Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsY5F-0002sn-BU
 for ath10k@lists.infradead.org; Mon, 16 Dec 2013 13:19:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix band reporting for mgmt CCK frames on 5GHz
References: <1386927883-14028-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 16 Dec 2013 15:19:12 +0200
In-Reply-To: <1386927883-14028-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 13 Dec 2013 10:44:43 +0100")
Message-ID: <87wqj5exwv.fsf@kamboji.qca.qualcomm.com>
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

> Although CCK modulation isn't expected for 11a if
> it happened it made ath10k report wrong band
> (2GHz) for a mgmt frame that were actually
> received on 5Ghz band. Frequency would also
> decoded incorrectly too.
>
> In case of 5GHz-only devices this triggered
> mac80211 WARN_ON because there was no according
> sband pointer to be found.
>
> The patch should fix delivery of such frames by
> using different means to acquire band parameter.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
