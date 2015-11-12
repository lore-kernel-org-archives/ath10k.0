Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwtGl-0006e6-O3
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 14:54:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: Override CE5 configuration for QCA6147 device
References: <1447266082-10933-1-git-send-email-ryanhsu@qca.qualcomm.com>
 <CAGRGNgXOPDF1fK6X2b-qiTBOLqh+fcScEDDZAoEWTJLDrXPFuA@mail.gmail.com>
Date: Thu, 12 Nov 2015 16:53:58 +0200
In-Reply-To: <CAGRGNgXOPDF1fK6X2b-qiTBOLqh+fcScEDDZAoEWTJLDrXPFuA@mail.gmail.com>
 (Julian Calaby's message of "Thu, 12 Nov 2015 21:47:28 +1100")
Message-ID: <87d1vf6zg9.fsf@kamboji.qca.qualcomm.com>
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
To: Julian Calaby <julian.calaby@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Ryan Hsu <ryanhsu@qca.qualcomm.com>

Julian Calaby <julian.calaby@gmail.com> writes:

>> +static void ath10k_pci_override_ce_config(struct ath10k *ar)
>> +{
>> +       struct ce_attr *attr;
>> +       struct ce_pipe_config *config;
>> +
>> +       /* For QCA6174 we're overriding the Copy Engine 5 configuration,
>> +        * since it is currently used for other feature.
>> +        */
>> +
>> +       /* Override Host's Copy Engine 5 configuration */
>> +       attr = &host_ce_config_wlan[5];
>> +       attr->src_sz_max = 0;
>> +       attr->dest_nentries = 0;
>> +
>> +       /* Override Target firmware's Copy Engine configuration */
>> +       config = &target_ce_config_wlan[5];
>> +       config->pipedir = __cpu_to_le32(PIPEDIR_OUT);
>> +       config->nbytes_max = __cpu_to_le32(2048);
>> +
>> +       /* Map from service/endpoint to Copy Engine */
>> +       target_service_to_ce_map_wlan[15].pipenum = __cpu_to_le32(1);
>> +}
>> +
>
> Stupid question: Why not have two different versions of each struct?
> One for QCA6174 and one for everyone else, and choose the appropriate
> one when they're uploaded to the firmware / used?

That's duplicate work when you change something in common CEs and
chances of missing something increases.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
