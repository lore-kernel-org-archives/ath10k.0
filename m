Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([144.76.43.152] helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXnCT-0000No-K0
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 07:45:39 +0000
Message-ID: <1397029496.4964.0.camel@jlt4.sipsolutions.net>
Subject: Re: ath10k: ieee80211_restart_work called with hardware scan in
 progress
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 09 Apr 2014 09:44:56 +0200
In-Reply-To: <53446607.1060609@candelatech.com>
 (sfid-20140408_231213_154583_EA8ACCB7)
References: <53399E42.2090504@candelatech.com>
 <CA+BoTQmfBGJxwFnpq+7dE7MgL_db5gkCvRVfhk9YFAAPLZQwHQ@mail.gmail.com>
 <53446607.1060609@candelatech.com> (sfid-20140408_231213_154583_EA8ACCB7)
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On Tue, 2014-04-08 at 14:11 -0700, Ben Greear wrote:
> On 03/31/2014 10:32 PM, Michal Kazior wrote:
> > On 31 March 2014 18:56, Ben Greear <greearb@candelatech.com> wrote:
> >> This came from a customer (demo) system.  Firmware is 10.1.389 based, modified
> >> by us.  It has lots of known issues, but I haven't seen the warning
> >> below before, and not sure it is specifically a bug with ath10k or not.
> > 
> > Hmm..
> 
> We are seeing crashes that are probably related to this fairly often.
> 
> Johannes:  Do you have any suggestion as to how to go about fixing this?

Abort the hw scan properly before calling hw restart.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
