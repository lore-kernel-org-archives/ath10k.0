Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [PATCH 2/2] dt: bindings: ath10k: Document qcom,
 ath10k-pre-calibration-data-mtd
References: <20200918162928.14335-1-ansuelsmth@gmail.com>
 <20200918162928.14335-2-ansuelsmth@gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <8f886e3d-e2ee-cbf8-a676-28ebed4977aa@gmail.com>
Date: Fri, 18 Sep 2020 18:53:35 +0200
MIME-Version: 1.0
In-Reply-To: <20200918162928.14335-2-ansuelsmth@gmail.com>
Content-Language: de-DE
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ansuel Smith <ansuelsmth@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

On 2020-09-18 18:29, Ansuel Smith wrote:
> Document use of qcom,ath10k-pre-calibration-data-mtd bindings used to
> define from where the driver will load the pre-cal data in the defined
> mtd partition.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Q: Doesn't mtd now come with nvmem support from the get go? So
the MAC-Addresses and pre-caldata could be specified as a
nvmem-node in the devicetree? I remember seeing that this was
worked on or was this mtd->nvmem dropped?

Cheers,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
