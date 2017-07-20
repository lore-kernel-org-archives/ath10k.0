Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dY7nn-0004u2-G1
 for ath10k@lists.infradead.org; Thu, 20 Jul 2017 09:31:25 +0000
Message-ID: <1500542664.2354.27.camel@pengutronix.de>
Subject: Re: [PATCH 000/102] Convert drivers to explicit reset API
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 20 Jul 2017 11:24:24 +0200
In-Reply-To: <20170720081157.GA11630@kroah.com>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
 <20170720081157.GA11630@kroah.com>
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Prashant Gaikwad <pgaikwad@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Peter Chen <Peter.Chen@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Marc Dietrich <marvin24@gmx.de>, Rakesh Iyer <riyer@nvidia.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-clk@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, Wolfram Sang <wsa@the-dreams.de>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Jiri Slaby <jslaby@suse.com>, Michael Turquette <mturquette@baylibre.com>, Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>, linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>, Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org, Tejun Heo <tj@kernel.org>, alsa-devel@alsa-project.org, linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, Philippe Cornu <philippe.cornu@st.com>, Kalle Valo <kvalo@qca.qualcomm.com>, Laxman Dewangan <ldewangan@nvidia.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Lars-Peter Clausen <lars@metafoo.de>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jon Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, linux-media@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, Alexandre Torgue <alexandre.torgue@st.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-arm-msm@vger.kernel.org, Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, Bjorn Helgaas <bhelgaas@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Patrice Chotard <patrice.chotard@st.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org, linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, ath10k@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>, linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Chen Feng <puck.chen@hisilicon.com>, Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Felipe Balbi <balbi@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-ide@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, devel@driverdev.osuosl.org, Yannick Fertre <yannick.fertre@st.com>, Ryder Lee <ryder.lee@mediatek.com>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Jaehoon Chung <jh80.chung@samsung.com>, Marek Vasut <marek.vasut@gmail.com>, linux-serial@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Alan Tull <atull@kernel.org>, John Youn <johnyoun@synopsys.com>, Eduardo Valentin <edubezval@gmail.com>, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mark Yao <mark.yao@rock-chips.com>, Moritz Fischer <moritz.fischer@ettus.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, netdev@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Boyd <sboyd@codeaurora.org>, Adrian Hunter <adrian.hunter@intel.com>, Vinod Koul <vinod.koul@intel.com>, Rongrong Zou <zourongrong@gmail.com>, linux-fpga@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Lucas Stach <l.stach@pengutronix.de>

Hi Greg,

The patches in this series are completely independent of each other, and
I would like the subsystem maintainers to apply them at their own
leisure.
Well, except for the last one, which I will apply only after there are
no more users of the transition helpers.

On Thu, 2017-07-20 at 10:11 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 19, 2017 at 05:25:04PM +0200, Philipp Zabel wrote:
> > The reset control API has two modes: exclusive access, where the driver
> > expects to have full and immediate control over the state of the reset
> > line, and shared (clock-like) access, where drivers only request reset
> > deassertion while active, but don't care about the state of the reset line
> > while inactive.
> > 
> > Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
> > reset lines") started to transition the reset control request API calls
> > to explicitly state whether the driver needs exclusive or shared reset
> > control behavior.
> > 
> > This series converts all drivers that currently implicitly request
> > exclusive reset controls to the corresponding explicit API call. It is,
> > for the most part, generated from the following semantic patch:
> 
> Hey, I'm all for large api changes, but this really seems ackward, isn't
> there a "better" way to do this?

It is a bit awkward. I am sorry I haven't done this earlier. Quite a few
new drivers started using the old API after the explicit requests were
introduced last year.

> Why not, as you say the "implicit" request is exclusive, just leave
> everything alone and state that the "reset_control_get()" call is
> exclusive 

I think it is better to let the drivers explicitly state what they
expect from the API, and using reset_control_get_exclusive vs _shared
helps driver developers to make a conscious decision.

Further, the implicit API call predates shared reset support, so it is
not clear that all of the old users really need exclusive control.
A few drivers have been switched to the shared API already.

> and make the shared one the "odd" usage as that seems to not
> be the normal case.

I am not sure, there have been people arguing that the "clock-like" case
really is the common one. I suppose some of those drivers touched by the
100 patches in this series could also be changed to shared. But I don't
dare to make this decision for each of them.

> That should be a much smaller patch right?
> 
> That way you don't break everything here, and require 100+ patches to
> just change the name of a function from one to another and do nothing
> else.

I don't break anything here, and I'm absolutely fine with squashing
patches together per subsystem where that is preferable.

regards
Philipp


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
