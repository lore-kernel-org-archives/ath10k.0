Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 000/102] Convert drivers to explicit reset API
Date: Thu, 20 Jul 2017 22:32:49 +0200
Message-ID: <1687646.TMvigZNUOP@phil>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
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
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter Chen <Peter.Chen@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Marc Dietrich <marvin24@gmx.de>, Rakesh Iyer <riyer@nvidia.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-clk@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, Wolfram Sang <wsa@the-dreams.de>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Jiri Slaby <jslaby@suse.com>, Michael Turquette <mturquette@baylibre.com>, Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>, linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>, Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org, Tejun Heo <tj@kernel.org>, alsa-devel@alsa-project.org, linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, Philippe Cornu <philippe.cornu@st.com>, Kalle Valo <kvalo@qca.qualcomm.com>, Laxman Dewangan <ldewangan@nvidia.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Lars-Peter Clausen <lars@metafoo.de>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jon Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, linux-media@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, Alexandre Torgue <alexandre.torgue@st.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-arm-msm@vger.kernel.org, Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, Bjorn Helgaas <bhelgaas@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Patrice Chotard <patrice.chotard@st.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org, linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, ath10k@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>, linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Chen Feng <puck.chen@hisilicon.com>, Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Felipe Balbi <balbi@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-ide@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, devel@driverdev.osuosl.org, Yannick Fertre <yannick.fertre@st.com>, Ryder Lee <ryder.lee@mediatek.com>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Jaehoon Chung <jh80.chung@samsung.com>, Marek Vasut <marek.vasut@gmail.com>, linux-serial@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Alan Tull <atull@kernel.org>, John Youn <johnyoun@synopsys.com>, Eduardo Valentin <edubezval@gmail.com>, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mark Yao <mark.yao@rock-chips.com>, Moritz Fischer <moritz.fischer@ettus.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, netdev@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Boyd <sboyd@codeaurora.org>, Adrian Hunter <adrian.hunter@intel.com>, Vinod Koul <vinod.koul@intel.com>, Rongrong Zou <zourongrong@gmail.com>, linux-fpga@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Lucas Stach <l.stach@pengutronix.de>

Hi,

>   crypto: rockchip: explicitly request exclusive reset control
>   iio: adc: rockchip_saradc: explicitly request exclusive reset control
>   PCI: rockchip: explicitly request exclusive reset control
>   phy: rockchip-pcie: explicitly request exclusive reset control
>   phy: rockchip-typec: explicitly request exclusive reset control
>   phy: rockchip-usb: explicitly request exclusive reset control
>   thermal: rockchip: explicitly request exclusive reset control

for the driver-related Rockchip changes

Acked-by: Heiko Stuebner <heiko@sntech.de>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
