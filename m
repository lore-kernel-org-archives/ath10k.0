Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58] helo=smtp.tuxdriver.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOWxf-00052y-Nk
 for ath10k@lists.infradead.org; Fri, 14 Mar 2014 18:36:04 +0000
Date: Fri, 14 Mar 2014 14:28:34 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20140311
Message-ID: <20140314182749.GB20339@tuxdriver.com>
References: <87y50hgghr.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y50hgghr.fsf@kamboji.qca.qualcomm.com>
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

On Tue, Mar 11, 2014 at 12:46:24PM +0200, Kalle Valo wrote:
> Hi John,
> 
> here's a new pull request from me, but just ath10k patches this time.
> Summary of the changes:
> 
> Michal now did some optimisations and was able to improve throughput by
> 100 Mbps on our MIPS based AP135 platform. Chun-Yeow added some
> workarounds to be able to better use ad-hoc mode. Ben improved log
> messages and added support for MSDU chaining. And, as usual, also some
> smaller fixes.
> 
> Please let me know if there are any problems.
> 
> Kalle
> 
> The following changes since commit ef1b4141d0430583743a6045901e4d1a73557a33:
> 
>   ath5k: set SURVEY_INFO_IN_USE on get_survey (2014-02-24 15:38:39 -0500)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git for-linville
> 
> for you to fetch changes up to 70dd77b4c50da518b57b8b9b125a8c9aabe9bc1a:
> 
>   ath10k: do not overwrite max_antenna_gain (2014-03-07 10:14:10 +0200)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
