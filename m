Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xly3Z-0000EO-5O
 for ath10k@lists.infradead.org; Wed, 05 Nov 2014 10:43:17 +0000
Date: Wed, 5 Nov 2014 16:14:59 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: handle ieee80211 header and payload tracing
 separately
Message-ID: <20141105104458.GA13249@qca.qualcomm.com>
References: <1414661336-20764-1-git-send-email-rmanohar@qti.qualcomm.com>
 <874muf7t9u.fsf@kamboji.qca.qualcomm.com>
 <20141104051643.GA14509@qca.qualcomm.com>
 <87k33a1lli.fsf@kamboji.qca.qualcomm.com>
 <20141105094437.GA21839@qca.qualcomm.com>
 <1415182321.2589.14.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1415182321.2589.14.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Wed, Nov 05, 2014 at 11:12:01AM +0100, Johannes Berg wrote:
> On Wed, 2014-11-05 at 15:14 +0530, Rajkumar Manoharan wrote:
> 
> > The macro is defined to ease readability and reduce # of line changes.
> > I originally thought of naming the macro as IEEE80211_HDR_LEN. But such
> > definition does not look correct inside driver.
> 
> FWIW, I pointed Kalle to the macro on IRC - IMHO you should pass
> arguments to the macro (and probably even make it an inline function)
> rather than having it assume certain variables exist when the macro is
> used.
> 
> Kalle may have misunderstood what I was trying to say :)
> 
Sounds clear..Thanks for pointing out. Will change it as inline funtion..

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
