Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <524BCAC4.6060209@broadcom.com>
Date: Wed, 2 Oct 2013 09:27:00 +0200
From: "Arend van Spriel" <arend@broadcom.com>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net:drivers/net: Miscellaneous conversions
 to ETH_ALEN
References: <1380679480.2081.24.camel@joe-AO722>
In-Reply-To: <1380679480.2081.24.camel@joe-AO722>
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
To: Joe Perches <joe@perches.com>, netdev <netdev@vger.kernel.org>
Cc: bridge@lists.linux-foundation.org, e1000-devel@lists.sourceforge.net, brcm80211-dev-list@broadcom.com, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, wil6210@qca.qualcomm.com, netfilter-devel <netfilter-devel@vger.kernel.org>, b43-dev@lists.infradead.org, linuxppc-dev@lists.ozlabs.org

On 10/02/2013 04:04 AM, Joe Perches wrote:
> Convert the memset/memcpy uses of 6 to ETH_ALEN
> where appropriate.
>
> Also convert some struct definitions and u8 array
> declarations of [6] to ETH_ALEN.
>
For brcmsmac

Acked-by: Arend van Spriel <arend@broadcom.com>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>   drivers/net/wireless/brcm80211/brcmsmac/main.c     |  6 +-



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
