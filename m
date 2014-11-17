Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Mon, 17 Nov 2014 15:29:44 -0500
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20141117
Message-ID: <20141117202944.GE3511@tuxdriver.com>
References: <87r3x1oneo.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r3x1oneo.fsf@kamboji.qca.qualcomm.com>
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

On Mon, Nov 17, 2014 at 05:30:07PM +0200, Kalle Valo wrote:
> Hi John,
> 
> new pull request again, here's the changelog:
> 
> ----------------------------------------------------------------------
> One ath6kl patch and rest for ath10k, but nothing really major which
> stands out. Most notable:
> 
> o fix resume (Bartosz)
> 
> o firmware restart is now faster and more reliable (Michal)
> 
> o it's now possible to test hardware restart functionality without
>   crashing the firmware using hw-restart parameter with
>   simulate_fw_crash debugfs file (Michal)
> 
> ----------------------------------------------------------------------
> 
> The following changes since commit 84cbf3a7592879810f80cece6c7f736f099ab163:
> 
>   ath10k: split ce pipe init/alloc further (2014-10-23 16:41:32 +0300)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git for-linville
> 
> for you to fetch changes up to 9de8f26f0038133bdfb8cf847936645dab949d88:
> 
>   ath10k: fix mismatched wmi api call (2014-11-17 16:48:49 +0200)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
