Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <1383760556.7940.28.camel@joe-AO722>
Subject: Re: [PATCH] wcn36xx: Fix logging macro with unnecessary semicolon
From: Joe Perches <joe@perches.com>
Date: Wed, 06 Nov 2013 09:55:56 -0800
In-Reply-To: <CAFSJ42YQy96Sko8CuG9BGjHzTV7TkRp2=NVt036APxSKpPB=Ag@mail.gmail.com>
References: <1383684000.4387.42.camel@joe-AO722>
 <CAFSJ42YQy96Sko8CuG9BGjHzTV7TkRp2=NVt036APxSKpPB=Ag@mail.gmail.com>
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
To: Eugene Krasnikov <k.eugene.e@gmail.com>, "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, ath5k-devel@lists.ath5k.org, linux-wireless <linux-wireless@vger.kernel.org>, "John W. Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath9k-devel <ath9k-devel@lists.ath9k.org>, wcn36xx <wcn36xx@lists.infradead.org>

On Wed, 2013-11-06 at 07:49 +0000, Eugene Krasnikov wrote:
> Hm... when it comes to semicolon the patch seems to be good. When it
> comes to dynamic debugging i think we should have a separate
> discussion about that.
> I personally like the whole idea about dynamic debug but if you want
> to change it i would suggest to have some kind of framework for all
> ath drivers(or maybe all wireless drivers). Because obviously you can
> find common code in every driver that defines it's own debug
> functions/debug levels and so on. Why not to make a framework with
> standard API/levels?

You need to bring that up with the Atheros folk.
I've tried.  The view seemed to be it was more
trouble than it was worth.




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
