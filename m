Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886E7C83030
	for <ath10k@archiver.kernel.org>; Sat,  5 Jul 2025 19:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NMjBGe4a9cz47KERc0/f4cidvyoaXRj3r5jVTdOdUXo=; b=cDoGDdWFg89o7Szg7C/8EZ2vqP
	HNpjtsgGlpd1DsM8MJM9D8teU0d0vtE/23DuXpiNa9ccnVquqExG/1d4qb7vnKZ5XkKcJyeLiqpiy
	pwNBvYobNuedAwdknjQ30gznHf4FRlZ3PSEx7StdqphjUEAZeQ9gXEd1IXjxvo3XoDuOJ/ckPXKx/
	TR1UijZUWZBktBNfz14WIPXFidvDadG+YOAj4e8tmCobjGScYAVw2pExx+u650TH4TiFbIsk6HKXt
	tFwlopk/RoK+ZuYNvTBl5DJoLRS7JuPBJ6bTWUmzdHQ5tRahHjbMaiLAKCgzNRsa+atM6VIFOTPxD
	ZkEWFPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY92A-0000000GwRW-0NzR;
	Sat, 05 Jul 2025 19:58:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY929-0000000GwRN-2wOY
	for ath10k@lists.infradead.org;
	Sat, 05 Jul 2025 19:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A58FE61155;
	Sat,  5 Jul 2025 19:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF56AC4CEE7;
	Sat,  5 Jul 2025 19:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751745528;
	bh=Xztashzz8S3rALHR7n+WkyY0p7wV1/pTuPU/AVjSB2M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FKlcUgtR8BPpPMDvBeSXGB2Ct5v8ELniZ9+JhPcv0Hb1o1OWTgBVLS2DyNUmFOqza
	 Y5lv22XMc/zfJ94wwaLJ4zcioveFQSIXQkAeQkeVKxvhawKfd/0FdTI8bEQRjXERN+
	 C5l/Q0DyVop2JqjR3w8b3sPyqT5iipwjWczVmqBcHLrwaiyMDLEcZpCZZDH/C4HnOj
	 DolwZDLT96eFLEf4p6CGMhK3D3NVVMZtWib27BmwgJjb1jXsf+JcKJktZFA/DDYScM
	 Inbq7BCi5+6jnCMNNl8C4Us9hm6SdXw+B6kurqjNjsGjU+62/m920s8831cq6oKCnn
	 TT/f6BHgfi5qQ==
Date: Sat, 5 Jul 2025 14:58:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
Message-ID: <20250705195846.GA2011829@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEmM+QjHnU0h3HtWH8AXP05k2dTYozu81eRxn45HVEUSRG8jLw@mail.gmail.com>
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Sat, Jul 05, 2025 at 08:30:46PM +0530, Bandhan Pramanik wrote:
> Hello,
> 
> The dmesg log (the older one) is present here:

[1]:
> https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180/raw/78460e6931a055b6776afe756a95d467913d5ebd/dmesg.log
> 
> The newer dmesg log includes the first line and is not overwritten by
> the ring buffer (used pci=noaer in this case):
> https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180/raw/78460e6931a055b6776afe756a95d467913d5ebd/updated-dmesg
>  (The newer one doesn't have the error recorded).
> 
> You should check out the older dmesg, the quoted line was taken from
> there verbatim, including any additional details.
> 
> Bandhan
> 
> On Sat, Jul 5, 2025 at 7:20 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Sat, Jul 05, 2025 at 01:00:23AM +0530, Bandhan Pramanik wrote:
> > > Hi everyone,
> > >
> > > Here after a week. I did my research.
> > >
> > > I talked to some folks on IRC and the glaring issue was basically this:
> > >
> > > > [ 1146.810055] pcieport 0000:00:1c.0: AER: Uncorrectable (Fatal) error message received from 0000:01:00.0

From [1]:

  [ 1146.810055] pcieport 0000:00:1c.0: AER: Uncorrectable (Fatal) error message received from 0000:01:00.0
  [ 1146.810069] ath10k_pci 0000:01:00.0: AER: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Inaccessible, (Unregistered Agent ID)
  [ 1146.813130] ath10k_pci 0000:01:00.0: AER: can't recover (no error_detected callback)
  [ 1146.948066] pcieport 0000:00:1c.0: AER: Root Port link has been reset (0)
  [ 1146.948112] pcieport 0000:00:1c.0: AER: device recovery failed
  [ 1146.949480] ath10k_pci 0000:01:00.0: failed to wake target for read32 at 0x0003a028: -110

I think Linux is not doing a very good job of extracting error
information.  I think is_error_source() read PCI_ERR_UNCOR_STATUS from
01:00.0 and saw an error logged, but aer_get_device_error_info()
declined to read PCI_ERR_UNCOR_STATUS again because we thought the
link was unusable, so aer_print_error() didn't have any info to print,
hence the "Inaccessible" message.

Are you able to rebuild a kernel with the patch below?  This is based
on v6.16-rc1 and likely wouldn't apply cleanly to your v6.14 kernel.
But if you are able to build v6.16-rc1 with this patch, or adapt it to
v6.14, I'd be interested in the output.

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 70ac66188367..99acb1e1946e 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -990,6 +990,8 @@ static bool is_error_source(struct pci_dev *dev, struct aer_err_info *e_info)
 	if ((PCI_BUS_NUM(e_info->id) != 0) &&
 	    !(dev->bus->bus_flags & PCI_BUS_FLAGS_NO_AERSID)) {
 		/* Device ID match? */
+		pci_info(dev, "%s: bus_flags %#x e_info->id %#04x\n",
+			 __func__, dev->bus->bus_flags, e_info->id);
 		if (e_info->id == pci_dev_id(dev))
 			return true;
 
@@ -1025,6 +1027,10 @@ static bool is_error_source(struct pci_dev *dev, struct aer_err_info *e_info)
 		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &status);
 		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &mask);
 	}
+	pci_info(dev, "%s: %s STATUS %#010x MASK %#010x\n",
+		 __func__,
+		 e_info->severity == AER_CORRECTABLE ? "COR" : "UNCOR",
+		 status, mask);
 	if (status & ~mask)
 		return true;
 
@@ -1368,6 +1374,8 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
 	aer = dev->aer_cap;
 	type = pci_pcie_type(dev);
 
+	pci_info(dev, "%s: type %#x cap %#04x\n", __func__, type, aer);
+
 	/* Must reset in this function */
 	info->status = 0;
 	info->tlp_header_valid = 0;
@@ -1383,16 +1391,14 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
 			&info->mask);
 		if (!(info->status & ~info->mask))
 			return 0;
-	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
-		   type == PCI_EXP_TYPE_RC_EC ||
-		   type == PCI_EXP_TYPE_DOWNSTREAM ||
-		   info->severity == AER_NONFATAL) {
-
+	} else {
 		/* Link is still healthy for IO reads */
 		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
 			&info->status);
 		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
 			&info->mask);
+		pci_info(dev, "%s: UNCOR STATUS %#010x MASK %#010x\n",
+			 __func__, info->status, info->mask);
 		if (!(info->status & ~info->mask))
 			return 0;
 
@@ -1471,6 +1477,8 @@ static void aer_isr_one_error(struct pci_dev *root,
 {
 	u32 status = e_src->status;
 
+	pci_info(root, "%s: ROOT_STATUS %#010x ROOT_ERR_SRC %#010x\n",
+		 __func__, e_src->status, e_src->id);
 	pci_rootport_aer_stats_incr(root, e_src);
 
 	/*

