Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWhvN-0001uV-Es
 for ath10k@lists.infradead.org; Sat, 14 Mar 2015 09:00:02 +0000
Date: Sat, 14 Mar 2015 09:59:38 +0100
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH 2/3 RFC] ath10k: wmi: match wait_for_completion_timeout
 return type
Message-ID: <20150314085938.GA13323@opentech.at>
References: <1426175362-8640-1-git-send-email-hofrat@osadl.org>
 <CA+BoTQ=VYkOcKBjBuLsJcDjPNevTD2UFxVfB1uimRr=9uBO4Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQ=VYkOcKBjBuLsJcDjPNevTD2UFxVfB1uimRr=9uBO4Fw@mail.gmail.com>
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
Cc: Network Development <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, linux-kernel@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Nicholas Mc Guire <hofrat@osadl.org>

On Fri, 13 Mar 2015, Michal Kazior wrote:

> On 12 March 2015 at 16:49, Nicholas Mc Guire <hofrat@osadl.org> wrote:
> > Return type of wait_for_completion_timeout is unsigned long not int.
> > An appropriately named unsigned long is added and the assignments fixed up.
> > Rather than returning 0 (timeout) or a more or less random remaining time
> > (completion success) this return 0 or 1 which also resolves the type of the
> > functions being int.
> >
> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > ---
> >
> > Checking the call-sites of ath10k_wmi_wait_for_unified_ready and
> > ath10k_wmi_wait_for_service_ready the positive return value (remaining
> > time in jiffies) is never passed up the call-chain nor used so it is
> > cleaner to treat this like a boolean success/fail only (actually the two
> > functions should probably be of type bool - but that does not seem to be
> > common practice in the ath10k code base)
> 
> It'd make sense to have these functions return 0 or -ETIMEDOUT. In
> that case both call sites would need to be adjusted to treat "< 0" or
> "!x" as an error (instead of the current "<= 0") condition and not set
> -ETIMEDOUT themselves.
>
looking at the call sites in ath10k_core_start more or less 
all other initialization calls will treate 0 as success and
!=0 as failure so this is the cleaner solution. as its all
now

status = call()
if(status)
 	error

patch just posted.

thx!
hofrat


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
