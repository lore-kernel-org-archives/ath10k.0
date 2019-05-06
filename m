Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNgWY-0006zO-AT
 for ath10k@lists.infradead.org; Mon, 06 May 2019 16:31:50 +0000
Received: by mail-lj1-x241.google.com with SMTP id h21so11599981ljk.13
 for <ath10k@lists.infradead.org>; Mon, 06 May 2019 09:31:29 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id q14sm2118280ljh.37.2019.05.06.09.31.25
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 09:31:25 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id k18so9597404lfj.13
 for <ath10k@lists.infradead.org>; Mon, 06 May 2019 09:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190506142603.1746-1-govinds@codeaurora.org>
In-Reply-To: <20190506142603.1746-1-govinds@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 6 May 2019 09:31:13 -0700
Message-ID: <CA+ASDXNuf5=Q4v8HqtM2xGvqN1c_0q9mBNo9wdO3pRcBBqe2oQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ath10k: Enable MSA region dump support for WCN3990
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Mon, May 6, 2019 at 7:26 AM Govind Singh <govinds@codeaurora.org> wrote:
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c

> @@ -1586,6 +1587,72 @@ static int ath10k_hw_power_off(struct ath10k *ar)
>         return ret;
>  }
>
> +static void ath10k_msa_dump_memory(struct ath10k *ar,
> +                                  struct ath10k_fw_crash_data *crash_data)
> +{
> +       struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
> +       const struct ath10k_hw_mem_layout *mem_layout;
> +       const struct ath10k_mem_region *current_region;
> +       struct ath10k_dump_ram_data_hdr *hdr;
> +       size_t buf_len;
> +       u8 *buf;
> +
> +       lockdep_assert_held(&ar->data_lock);

I believe that's the wrong lock now. See below.

> +
> +       if (!crash_data && !crash_data->ramdump_buf)
> +               return;
> +
> +       mem_layout = ath10k_coredump_get_mem_layout(ar);
> +       if (!mem_layout)
> +               return;
> +
> +       current_region = &mem_layout->region_table.regions[0];
> +
> +       buf = crash_data->ramdump_buf;
> +       buf_len = crash_data->ramdump_buf_len;
> +       memset(buf, 0, buf_len);
> +
> +       /* Reserve space for the header. */
> +       hdr = (void *)buf;
> +       buf += sizeof(*hdr);
> +       buf_len -= sizeof(*hdr);
> +
> +       hdr->region_type = cpu_to_le32(current_region->type);
> +       hdr->start = cpu_to_le32(ar_snoc->qmi->msa_va);
> +       hdr->length = cpu_to_le32(ar_snoc->qmi->msa_mem_size);
> +
> +       if (current_region->len < ar_snoc->qmi->msa_mem_size) {
> +               memcpy(buf, ar_snoc->qmi->msa_va, current_region->len);
> +               ath10k_warn(ar, "msa dump length is less than msa size %x, %x\n",
> +                           current_region->len, ar_snoc->qmi->msa_mem_size);
> +       } else {
> +               memcpy(buf, ar_snoc->qmi->msa_va, ar_snoc->qmi->msa_mem_size);
> +       }
> +}
> +
> +void ath10k_snoc_fw_crashed_dump(struct ath10k *ar)
> +{
> +       struct ath10k_fw_crash_data *crash_data;
> +       char guid[UUID_STRING_LEN + 1];
> +
> +       spin_lock_bh(&ar->data_lock);
> +
> +       ar->stats.fw_crash_counter++;
> +
> +       crash_data = ath10k_coredump_new(ar);

This will (for good reason) spit a lockdep warning after this, I think:

38faed150438 ath10k: perform crash dump collection in workqueue

You need to hold 'dump_mutex' now. I believe you only need to hold
'data_lock' for the sake of the crash counter.

Brian

> +
> +       if (crash_data)
> +               scnprintf(guid, sizeof(guid), "%pUl", &crash_data->guid);
> +       else
> +               scnprintf(guid, sizeof(guid), "n/a");
> +
> +       ath10k_err(ar, "firmware crashed! (guid %s)\n", guid);
> +       ath10k_print_driver_info(ar);
> +       ath10k_msa_dump_memory(ar, crash_data);
> +
> +       spin_unlock_bh(&ar->data_lock);
> +}

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
