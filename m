Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmV8W-0004g5-Ko
 for ath10k@lists.infradead.org; Tue, 08 Dec 2020 05:02:05 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <20201207231824.v3.1.Ia6b95087ca566f77423f3802a78b946f7b593ff5@changeid>
In-Reply-To: <20201207231824.v3.1.Ia6b95087ca566f77423f3802a78b946f7b593ff5@changeid>
Subject: RE: [PATCH v3] ath10k: add option for chip-id based BDF selection
Date: Tue, 8 Dec 2020 10:31:42 +0530
Message-ID: <005d01d6cd1f$3c469ff0$b4d3dfd0$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Abhishek Kumar' <kuabhs@chromium.org>, kvalo@codeaurora.org
Cc: netdev@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, 'Jakub Kicinski' <kuba@kernel.org>, "'David S. Miller'" <davem@davemloft.net>

Hi,


> -----Original Message-----
> From: Abhishek Kumar <kuabhs@chromium.org>
> Sent: Tuesday, December 8, 2020 4:50 AM
> To: kvalo@codeaurora.org
> Cc: linux-kernel@vger.kernel.org; kuabhs@chromium.org; linux-
> wireless@vger.kernel.org; ath10k@lists.infradead.org;
> pillair@codeaurora.org; briannorris@chromium.org;
> dianders@chromium.org; David S. Miller <davem@davemloft.net>; Jakub
> Kicinski <kuba@kernel.org>; netdev@vger.kernel.org
> Subject: [PATCH v3] ath10k: add option for chip-id based BDF selection
> 
> In some devices difference in chip-id should be enough to pick
> the right BDF. Add another support for chip-id based BDF selection.
> With this new option, ath10k supports 2 fallback options.
> 
> The board name with chip-id as option looks as follows
> board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320'
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
> Tested-on: QCA6174 HW3.2 WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
> 
> Changes in v3:
> - Resurreted Patch V1 because as per discussion we do need two
> fallback board names and refactored ath10k_core_create_board_name.
> 
>  drivers/net/wireless/ath/ath10k/core.c | 41 +++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 11 deletions(-)

Reviewed-by: Rakesh Pillai <pillair@codeaurora.org>

Thanks,
Rakesh Pillai.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
