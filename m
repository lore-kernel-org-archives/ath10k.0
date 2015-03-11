Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVm1l-0002aQ-Fc
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 19:10:46 +0000
Message-ID: <1426101010.1904.9.camel@sipsolutions.net>
Subject: Re: [PATCH RFC v2] ath10k: move code from parameter list into a
 function
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 11 Mar 2015 20:10:10 +0100
In-Reply-To: <1426100519-20636-1-git-send-email-hofrat@osadl.org>
 (sfid-20150311_200723_379167_2BC79246)
References: <1426100519-20636-1-git-send-email-hofrat@osadl.org>
 (sfid-20150311_200723_379167_2BC79246)
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
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Jeff Haran <Jeff.Haran@citrix.com>, Valdis.Kletnieks@vt.edu, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Pat Erley <pat-lkml@erley.org>, Bj??rn Mork <bjorn@mork.no>

On Wed, 2015-03-11 at 15:01 -0400, Nicholas Mc Guire wrote:
> Putting code into the parameter list of wait_event_timeout() might be
> legal C-code but not really readable - the "inline" code is simply
> moved into a function and that passed to wait_event_timeout() as the
> condition.

Arguably, that's even more unreadable since if you don't know this macro
well you might assume the function is called only once, which is clearly
not true...

Don't get me wrong, I'm not opposed to this change, but if you ask me
it's not completely clear that this makes it more readable.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
