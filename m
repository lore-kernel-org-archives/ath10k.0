Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Fri, 18 Jul 2014 13:45:15 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20140717
Message-ID: <20140718174515.GF31114@tuxdriver.com>
References: <87k37c6kw6.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k37c6kw6.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath6kl@lists.infradead.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, Jul 17, 2014 at 06:54:33PM +0300, Kalle Valo wrote:
> Hi John,
> 
> here's new pull request for 3.17. Major changes are:
> 
> For ath6kl me and Jessica added support for ar6004 hw3.0, our latest
> version of ar6004.
> 
> For ath10k Janusz added a printout so that it's easier to check what
> ath10k kconfig options are enabled. He also added a debugfs file to
> configure maximum amsdu and ampdu values. Also we had few fixes as
> usual.
> 
> Please let me know if there are any problems.
> 
> Kalle
> 
> The following changes since commit a715c7ddd65a1a3b2839b8ebd759bb2d361f7675:
> 
>   wil6210: improve debug for WMI receive (2014-05-30 13:49:34 -0400)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git tags/for-linville-20140717
> 
> for you to fetch changes up to 993619443774f7ef4df3b98655df4c3bf298548c:
> 
>   ath10k: sanitize tx ring index access properly (2014-07-15 11:19:45 +0300)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
