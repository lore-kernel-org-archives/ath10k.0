Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath: change logging functions to return void
References: <1411407334.2952.46.camel@joe-AO725>
 <874mvzj7bu.fsf@kamboji.qca.qualcomm.com>
 <20140923144627.GG23806@tuxdriver.com>
Date: Tue, 23 Sep 2014 18:17:25 +0300
In-Reply-To: <20140923144627.GG23806@tuxdriver.com> (John W. Linville's
 message of "Tue, 23 Sep 2014 10:46:27 -0400")
Message-ID: <878ulacqnu.fsf@kamboji.qca.qualcomm.com>
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
To: "John W. Linville" <linville@tuxdriver.com>
Cc: wil6210 <wil6210@qca.qualcomm.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Vladimir Kondratiev <qca_vkondrat@qca.qualcomm.com>, ath6kl@lists.infradead.org, Joe Perches <joe@perches.com>

"John W. Linville" <linville@tuxdriver.com> writes:

> On Tue, Sep 23, 2014 at 07:20:53AM +0300, Kalle Valo wrote:
>> Joe Perches <joe@perches.com> writes:
>> 
>> >  drivers/net/wireless/ath/wil6210/debug.c   | 14 ++++----------
>> >  drivers/net/wireless/ath/wil6210/wil6210.h |  7 +++++--
>> >  7 files changed, 32 insertions(+), 56 deletions(-)
>> 
>> John, as this patch also contains a wil6210 change how do you want to
>> handle this?
>
> I had presumed that you would merge it through the ath tree, so I
> deleted it...

That's a clear case then, I'll take it :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
