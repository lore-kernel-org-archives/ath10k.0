Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([144.76.43.152] helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmQ8V-0004sj-Rp
 for ath10k@lists.infradead.org; Fri, 29 Nov 2013 15:37:44 +0000
Message-ID: <1385739434.8656.0.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH v2 1/3] ath10k: use nss provided by mac80211
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 29 Nov 2013 16:37:14 +0100
In-Reply-To: <CA+BoTQmtkBGpktbLRfmiLuLDKP9TnUeWu4OMeGUsVcq7m05u4Q@mail.gmail.com>
 (sfid-20131127_112551_029392_CB0E2653)
References: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
 <1385474260-22385-1-git-send-email-michal.kazior@tieto.com>
 <1385474260-22385-2-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQmtkBGpktbLRfmiLuLDKP9TnUeWu4OMeGUsVcq7m05u4Q@mail.gmail.com>
 (sfid-20131127_112551_029392_CB0E2653)
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Wed, 2013-11-27 at 11:25 +0100, Michal Kazior wrote:
> On 26 November 2013 14:57, Michal Kazior <michal.kazior@tieto.com> wrote:
> > Calculating STA NSS just from the mcs rateset is
> > not the greatest idea.
> >
> > This should prevent connectivity issues if
> > mac80211 is ever to set rx_nss to something other
> > rather than base on max mcs map. As an example
> > operation mode change notification in assoc
> > request may change rx_nss initial values in the
> > future.
> >
> > Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> > ---
> 
> Drop this single patch, please.
> 
> I just noticed rx_nss doesn't seem to have correct value when associating..

FWIW, there are pending changes to make the opmode data come from
hostapd to mac80211 so that this would be set correctly when the station
is associating.

Or where did you find it wasn't set correctly?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
