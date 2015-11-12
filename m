Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22e.google.com ([2607:f8b0:4001:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwpQH-0000r9-ML
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 10:48:10 +0000
Received: by ioir85 with SMTP id r85so20187871ioi.1
 for <ath10k@lists.infradead.org>; Thu, 12 Nov 2015 02:47:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1447266082-10933-1-git-send-email-ryanhsu@qca.qualcomm.com>
References: <1447266082-10933-1-git-send-email-ryanhsu@qca.qualcomm.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 12 Nov 2015 21:47:28 +1100
Message-ID: <CAGRGNgXOPDF1fK6X2b-qiTBOLqh+fcScEDDZAoEWTJLDrXPFuA@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: Override CE5 configuration for QCA6147 device
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
To: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi Ryan,

On Thu, Nov 12, 2015 at 5:21 AM, Ryan Hsu <ryanhsu@qca.qualcomm.com> wrote:
> 'Commit a70587b3389a ("ath10k: configure copy engine 5 for HTT messages")'
> Introduces to use the unused CE5 for target to host message.
>
> For the device like QCA6174, CE5 already assigned for other feature.
> So for QCA6174, override the CE5 configuration and use the CE1 instead.
>
> This patch is based on Rajkumar's earlier patch.
>
> Fixes: a70587b3389a ("ath10k: configure copy engine 5 for HTT messages")
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/pci.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index 5c91a67..2a48376 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -113,7 +113,7 @@ static void ath10k_pci_htt_tx_cb(struct ath10k_ce_pipe *ce_state);
>  static void ath10k_pci_htt_rx_cb(struct ath10k_ce_pipe *ce_state);
>  static void ath10k_pci_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state);
>
> -static const struct ce_attr host_ce_config_wlan[] = {
> +static struct ce_attr host_ce_config_wlan[] = {
>         /* CE0: host->target HTC control and raw streams */
>         {
>                 .flags = CE_ATTR_FLAGS,
> @@ -219,7 +219,7 @@ static const struct ce_attr host_ce_config_wlan[] = {
>  };
>
>  /* Target firmware's Copy Engine configuration. */
> -static const struct ce_pipe_config target_ce_config_wlan[] = {
> +static struct ce_pipe_config target_ce_config_wlan[] = {
>         /* CE0: host->target HTC control and raw streams */
>         {
>                 .pipenum = __cpu_to_le32(0),
> @@ -332,7 +332,7 @@ static const struct ce_pipe_config target_ce_config_wlan[] = {
>   * This table is derived from the CE_PCI TABLE, above.
>   * It is passed to the Target at startup for use by firmware.
>   */
> -static const struct service_to_pipe target_service_to_ce_map_wlan[] = {
> +static struct service_to_pipe target_service_to_ce_map_wlan[] = {
>         {
>                 __cpu_to_le32(ATH10K_HTC_SVC_ID_WMI_DATA_VO),
>                 __cpu_to_le32(PIPEDIR_OUT),     /* out = UL = host -> target */
> @@ -2038,6 +2038,29 @@ static int ath10k_pci_init_config(struct ath10k *ar)
>         return 0;
>  }
>
> +static void ath10k_pci_override_ce_config(struct ath10k *ar)
> +{
> +       struct ce_attr *attr;
> +       struct ce_pipe_config *config;
> +
> +       /* For QCA6174 we're overriding the Copy Engine 5 configuration,
> +        * since it is currently used for other feature.
> +        */
> +
> +       /* Override Host's Copy Engine 5 configuration */
> +       attr = &host_ce_config_wlan[5];
> +       attr->src_sz_max = 0;
> +       attr->dest_nentries = 0;
> +
> +       /* Override Target firmware's Copy Engine configuration */
> +       config = &target_ce_config_wlan[5];
> +       config->pipedir = __cpu_to_le32(PIPEDIR_OUT);
> +       config->nbytes_max = __cpu_to_le32(2048);
> +
> +       /* Map from service/endpoint to Copy Engine */
> +       target_service_to_ce_map_wlan[15].pipenum = __cpu_to_le32(1);
> +}
> +

Stupid question: Why not have two different versions of each struct?
One for QCA6174 and one for everyone else, and choose the appropriate
one when they're uploaded to the firmware / used?

I believe there's a struct full of part specific data, it could
potentially go in there.

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
