Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlxZj-0007EZ-3s
 for ath10k@lists.infradead.org; Wed, 05 Nov 2014 10:12:27 +0000
Message-ID: <1415182321.2589.14.camel@sipsolutions.net>
Subject: Re: [PATCH v2] ath10k: handle ieee80211 header and payload tracing
 separately
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 05 Nov 2014 11:12:01 +0100
In-Reply-To: <20141105094437.GA21839@qca.qualcomm.com>
 (sfid-20141105_104310_542370_58A02806)
References: <1414661336-20764-1-git-send-email-rmanohar@qti.qualcomm.com>
 <874muf7t9u.fsf@kamboji.qca.qualcomm.com>
 <20141104051643.GA14509@qca.qualcomm.com>
 <87k33a1lli.fsf@kamboji.qca.qualcomm.com>
 <20141105094437.GA21839@qca.qualcomm.com>
 (sfid-20141105_104310_542370_58A02806)
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Wed, 2014-11-05 at 15:14 +0530, Rajkumar Manoharan wrote:

> The macro is defined to ease readability and reduce # of line changes.
> I originally thought of naming the macro as IEEE80211_HDR_LEN. But such
> definition does not look correct inside driver.

FWIW, I pointed Kalle to the macro on IRC - IMHO you should pass
arguments to the macro (and probably even make it an inline function)
rather than having it assume certain variables exist when the macro is
used.

Kalle may have misunderstood what I was trying to say :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
